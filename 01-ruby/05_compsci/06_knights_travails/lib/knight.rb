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

  attr_accessor :loc, :parent, :children

  def initialize(loc = [1, 1], parent = nil)
    @loc = loc
    @parent = parent
    @children = Board.available_squares(self)
  end

  def moves
    MOVEMENT
  end

  def build_path(goal_coords)
    queue = []
    pointer = self
    move_hist = []
    until pointer.loc == goal_coords
      pointer.children.each do |child|
        queue << Knight.new(child, pointer) unless move_hist.include?(pointer) || move_hist.include?(child)
      end
      move_hist << pointer
      pointer = queue.shift
    end
    preorder(pointer)
  end

  def preorder(piece, result = [])
    return if piece.nil?

    result.unshift(piece.loc)
    preorder(piece.parent, result) if piece.parent
    result
  end
end
