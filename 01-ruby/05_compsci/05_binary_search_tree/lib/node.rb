# frozen_string_literal: true

# Node class to be fed into Tree
class Node
  include Comparable
  attr_accessor :value, :left, :right

  def initialize(value = nil)
    @value = value
    @left = nil
    @right = nil
  end

  def delete
    @@instances.delete(self)
  end

  def num_children
    children = 0
    children += 1 unless @left.nil?
    children += 1 unless @right.nil?
    children
  end

  def leftmost
    return self if @left.nil?

    @left.leftmost
  end

  def inorder_successor
    return nil if @right.nil?

    @right.leftmost
  end

  def children
    return nil if nil?

    arr = []
    arr << @left if @left
    arr << @right if @right
    arr
  end

  def lowest?
    @left.nil? && @right.nil?
  end
end
