# frozen_string_literal: true

require_relative 'node'
require_relative 'linked_list'

# Hashmap class
class HashMap
  attr_accessor :capacity, :load_factor, :buckets

  def initialize(capacity = 16, load_factor = 0.75)
    @capacity = capacity
    @load_factor = load_factor
    @buckets = Array.new(@capacity)
  end

  def fib_hash(key)
    hash_code = 0
    golden = 1.618
    key.each_char do |char|
      hash_code = (hash_code * golden).to_i + char.ord
    end
    hash_code
  end

  def set(key, value)
  end
end
