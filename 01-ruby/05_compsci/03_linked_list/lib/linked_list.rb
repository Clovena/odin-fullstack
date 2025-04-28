# frozen_string_literal: false

# Methods for Class LinkedList
class LinkedList
  def initialize
    @list = []
  end

  def to_s
    print = ''
    @list.each do |elem|
      print << "( #{elem} ) -> "
    end
    print << 'nil'
    print
  end

  def append(value)
    @list << value
  end

  def prepend(value)
    @list = value << @list
  end

  def size
    @list.length
  end

  def head
    @list[0]
  end

  def tail
    @list[-1]
  end

  def at(index)
    @list[index]
  end

  def pop
    popped = tail
    @list = @list[0..-2]
    popped
  end

  def contains?(value)
    @list.include? value
  end
end
