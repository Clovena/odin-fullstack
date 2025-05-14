# frozen_string_literal: true

require 'pry-byebug'
require_relative 'lib/tree'

tree = Tree.new(Array.new(15) { rand(1..100) })
puts tree
puts tree.balanced? # true

puts "Level-order: #{tree.level_order}"
puts "Pre-order: #{tree.preorder}"
puts "In-order: #{tree.inorder}"
puts "Post-order: #{tree.postorder}"

7.times { tree.insert(rand(1..100)) }
puts tree
puts tree.balanced? # false

tree.rebalance!
puts tree.balanced? # true

puts "Level-order: #{tree.level_order}"
puts "Pre-order: #{tree.preorder}"
puts "In-order: #{tree.inorder}"
puts "Post-order: #{tree.postorder}"

puts tree
