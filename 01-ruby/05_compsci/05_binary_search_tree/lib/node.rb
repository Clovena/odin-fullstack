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

  def child
    return nil if nil?
    return nil unless num_children == 1

    @left || @right
  end

  def lowest?
    @left.nil? && @right.nil?
  end

  # Deletion methods depending on case
  def overwrite(child)
    if child.nil?
      @value = nil
    else
      @value = child.value
      @left = child.left
      @right = child.right
    end
  end
end
