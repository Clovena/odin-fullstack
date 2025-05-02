# frozen_string_literal: true

require_relative 'node'
require_relative 'linked_list'

# Hashmap class
class Hashmap # rubocop:disable Metrics/ClassLength
  INITIAL_CAPACITY = 16
  LOAD_FACTOR = 0.75
  HASH_MULT = 97

  attr_accessor :capacity, :load_factor, :buckets

  ### General methods ###
  def initialize
    @capacity = INITIAL_CAPACITY
    @load_factor = LOAD_FACTOR
    @buckets = Array.new(@capacity) { LinkedList.new }
  end

  def to_s
    puts "Size: #{size}"
    puts "Capacity: #{@capacity}"
    @buckets.each_with_index do |bucket, index|
      bucket.format(index)
    end
  end

  def hash(key)
    hash_code = 0
    key_str = "#{key}#{key.class}"
    key_str.each_char do |char|
      hash_code = (hash_code * HASH_MULT) + char.ord
    end
    hash_code % @capacity
  end

  ### Methods to interact with hashmap elements ###
  def set(key, value)
    rehash if size >= (@capacity * @load_factor)
    bucket = @buckets[hash(key)]
    if bucket.contains? key
      bucket.replace(key, value)
    else
      bucket.append(key, value)
    end
  end

  def get(key)
    bucket = @buckets[hash(key)]
    bucket.size.times do |index|
      return bucket[index].values[0] if bucket[index].keys[0] == key
    end
    nil
  end

  def at(index)
    @buckets.at(index)
  end
  alias [] at

  def remove(key)
    return nil unless has? key

    if @buckets[hash(key)].size <= 1
      @buckets[hash(key)] = LinkedList.new
    else
      @buckets[hash(key)].remove_at(index(key))
    end
  end

  ### Methods to retrive keys and values ###
  def keys
    keys = []
    @buckets.each do |list|
      list.size.times do |index|
        keys << list[index].keys[0] unless list[index].keys[0].nil?
      end
    end
    keys
  end

  def values
    values = []
    @buckets.each do |list|
      list.size.times do |index|
        values << list[index].values[0] unless list[index].values[0].nil?
      end
    end
    values
  end

  def entries
    keys_arr = keys
    values_arr = values
    entries = []
    keys_arr.length.times do |index|
      entries << [keys_arr[index], values_arr[index]]
    end
    entries
  end

  ### Methods to retrive metadata ###
  def index(key)
    bucket = @buckets[hash(key)]
    key_index = 0
    bucket.size.times do |index|
      return key_index if bucket[index].keys[0] == key

      key_index += 1
    end
  end

  def has?(key)
    return true if keys.include? key

    false
  end

  def size
    keys.length
  end
  alias length size

  def buckets_used
    @buckets.reject(&:empty?).length
  end

  def empty?
    size.zero?
  end

  ### Methods to re-generate hashmap ###
  def rehash
    @capacity *= 2
    previous = @buckets
    @buckets = Array.new(@capacity) { LinkedList.new }
    previous.each do |list|
      list.size.times do |index|
        set(list[index].keys[0], list[index].values[0])
      end
    end
  end

  def clear
    @buckets = Array.new(@capacity) { LinkedList.new }
  end
end
