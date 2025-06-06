# frozen_string_literal: false

require_relative 'node'

# Methods for Class LinkedList
class LinkedList
  attr_accessor :list

  def initialize
    @list = nil
  end

  def to_s
    print = ''
    link = @list
    while link
      print << "( #{link.value} ) -> "
      link = link.next_node
    end
    print << 'nil'
    print
  end

  def append(value)
    if @list.nil?
      @list = Node.new(value)
    else
      current = @list
      current = current.next_node until current.next_node.nil?
      current.next_node = Node.new(value)
    end
  end

  def prepend(value)
    previous = @list unless @list.nil?
    @list = Node.new(value)
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
    @list.value
  end

  def tail
    current = @list
    current = current.next_node until current.next_node.nil?
    current.value
  end

  def at(index)
    current = @list
    index.times do
      current = current.next_node
    end
    current.value
  end
  alias [] at

  def pop
    current = @list
    current = current.next_node until current.next_node.next_node.nil?
    popped = current.next_node
    current.next_node = nil
    popped
  end

  def contains?(value)
    current = @list
    until current.nil?
      return true if current.value == value

      current = current.next_node
    end
    false
  end

  def find(value)
    index = 0
    current = @list
    until current.nil?
      return index if current.value == value

      current = current.next_node
      index += 1
    end
    nil
  end

  def insert_at(value, index)
    current = @list
    (index - 1).times do
      current = current.next_node
    end
    tail = current.next_node
    current.next_node = Node.new(value, tail)
    current
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
end
