# frozen_string_literal: true

require_relative 'board'

# Knight class
class Knight
  include Board
  include Move

  MOVEMENT = [
    [2, 1],
    [1, 2],
    [-1, 2],
    [-2, 1],
    [-2, -1],
    [-1, -2],
    [1, -2],
    [2, -1]
  ].freeze

  attr_accessor :loc, :history

  def initialize(loc = [1, 1], parent = nil)
    @loc = loc
    @parent = parent
    @children = Board.available_squares(self)
    # @history = []
  end

  def moves
    MOVEMENT
  end
end
