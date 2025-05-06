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
end
