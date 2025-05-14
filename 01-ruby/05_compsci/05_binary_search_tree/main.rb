# frozen_string_literal: true

require 'pry-byebug'
require_relative 'lib/tree'

tree = Tree.new([1, 7, 4, 14, 11, 10, 0, 23, 8, 9, 4, 3, 5, 7, 9, 27, 38, 31])
puts tree
puts
puts

# tree.delete(3)
# tree.delete(23)
puts "Preorder: #{tree.preorder}"
puts "Inorder: #{tree.inorder}"
puts "Postorder: #{tree.postorder}"
puts
puts

test = [1, 9, 23, 38]

test.each do |elem|
  puts "#{elem} is at height #{tree.height(elem)} and depth #{tree.depth(elem)}."
end
