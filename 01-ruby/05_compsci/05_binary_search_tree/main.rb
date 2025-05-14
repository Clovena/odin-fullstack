# frozen_string_literal: true

require 'pry-byebug'
require_relative 'lib/tree'

tree = Tree.new(Array.new(15) { rand(1..100) })
puts tree

puts tree.balanced?
