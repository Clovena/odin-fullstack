# frozen_string_literal: true

require_relative 'lib/tree'

tree = Tree.new([1, 7, 4, 14, 11, 10, 0, 23, 8, 9, 4, 3, 5, 7, 9, 27, 38, 31])
puts tree

tree.delete(3)
tree.delete(1)
puts tree
