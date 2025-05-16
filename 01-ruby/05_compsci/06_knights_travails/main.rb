# frozen_string_literal: true

require 'pry-byebug'
require_relative 'lib/board'
require_relative 'lib/move'
require_relative 'lib/knight'

def knight_moves(start, goal)
  path = Knight.new(start).build_path(goal)
  puts "This takes #{path.size} moves:"
  path.each { |coords| p coords }
end

# n = Knight.new([3, 3])
# puts "The knight is on #{Board.coords_to_algebraic(n.loc)}."
# puts "The last move was #{Board.coords_to_algebraic(n.loc, n)}."

# puts Move.to(n, [4, 5])

# puts 'Now for the available squares:'
# Board.available_squares(n).each do |coords|
#   puts Board.coords_to_algebraic(coords)
# end

knight_moves([2, 2], [8, 6])
