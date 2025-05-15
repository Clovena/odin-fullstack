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

  def move_tree(goal_coords)
    # debugger
    queue = []
    current = self
    move_hist = []
    until current.loc == goal_coords
      current.children.each do |child|
        queue << Knight.new(child, current) unless move_hist.include?(current) || move_hist.include?(child)
      end
      move_hist << current
      current = queue.shift
    end
    display_parent(current)
  end

  def display_parent(piece)
    display_parent(piece.parent) unless piece.parent.nil?
    p piece.loc
  end
end
