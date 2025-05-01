# frozen_string_literal: false

require_relative 'node'

# Methods for Class LinkedList
class LinkedList
  attr_accessor :list

  def initialize
    @list = nil
  end

  def format(index = nil)
    str = index.nil? ? '' : "Bucket #{index}: "
    link = @list
    until link.nil?
      str << "{ :#{link.key} => #{link.value} } -> "
      link = link.next_node
    end
    str << 'nil'
    puts str
  end
  alias to_s format

  def empty?
    @list.nil?
  end

  def append(key, value)
    if @list.nil?
      @list = Node.new(key, value)
    else
      current = @list
      current = current.next_node until current.next_node.nil?
      current.next_node = Node.new(key, value)
    end
  end

  def prepend(key, value)
    previous = @list unless @list.nil?
    @list = Node.new(key, value)
    @list.next_node = previous unless @list.nil?
  end

  def size
    length = 0
    current = @list
    until current.nil?
      length += 1
      current = current.next_node
    end
    length
  end

  def head
    { @list.key => @list.value }
  end

  def tail
    current = @list
    current = current.next_node until current.next_node.nil?
    { current.key => current.value }
  end

  def at(index)
    current = @list
    index.times do
      current = current.next_node
    end
    { current.key => current.value }
  end
  alias [] at

  def pop
    current = @list
    current = current.next_node until current.next_node.next_node.nil?
    popped = current.next_node
    current.next_node = nil
    popped
  end

  def contains?(key)
    current = @list
    until current.nil?
      return true if current.key == key

      current = current.next_node
    end
    false
  end

  def find(key)
    index = 0
    current = @list
    until current.nil?
      return index if current.key == key

      current = current.next_node
      index += 1
    end
    nil
  end

  def remove_at(index)
    current = @list
    (index - 1).times do
      current = current.next_node
    end
    tail = current.next_node.next_node
    current.next_node = tail
    current
  end

  def insert_at(key, value, index)
    current = @list
    (index - 1).times do
      current = current.next_node
    end
    tail = current.next_node
    current.next_node = Node.new(key, value, tail)
    current
  end

  def replace(key, value)
    index = find(key)
    if index.zero?
      prepend(key, value)
      remove_at(1)
    else
      remove_at(index)
      insert_at(key, value, index)
    end
  end
end
