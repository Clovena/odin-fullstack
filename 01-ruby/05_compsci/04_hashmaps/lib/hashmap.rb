# frozen_string_literal: true

require_relative 'node'
require_relative 'linked_list'

# Hashmap class
class Hashmap
  INITIAL_CAPACITY = 16
  LOAD_FACTOR = 0.75
  GOLDEN_RATIO = 1.618

  attr_accessor :capacity, :load_factor, :buckets

  ### High level methods
  def initialize
    @capacity = INITIAL_CAPACITY
    @load_factor = LOAD_FACTOR
    @buckets = Array.new(@capacity) { LinkedList.new }
  end

  def hash_fibs(key)
    hash_code = 0
    key_str = "#{key}#{key.class}"
    key_str.each_char do |char|
      hash_code = (hash_code * GOLDEN_RATIO).to_i + char.ord
    end
    hash_code % @capacity
  end

  def to_s
    puts "Size: #{size}"
    puts "Capacity: #{@capacity}"
    @buckets.each_with_index do |bucket, index|
      bucket.format(index)
    end
  end

  ### Methods to retrive metadata
  def size
    @buckets.reject(&:empty?).size
  end
  alias length size

  def empty?
    size.zero?
  end

  def keys
    keys = []
    @buckets.each do |list|
      list.size.times do |index|
        keys << list[index].keys[0] unless list[index].keys[0].nil?
      end
    end
    keys
  end

  ### Methods to re-generate hashmap
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

  ### Methods to interact with hashmap elements
  def set(key, value)
    rehash if size >= (@capacity * @load_factor)
    bucket = @buckets[hash_fibs(key)]
    if bucket.contains? key
      bucket.replace(key, value)
    else
      bucket.append(key, value)
    end
  end

  def at(index)
    @buckets.at(index)
  end
  alias [] at
end
