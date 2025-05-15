# frozen_string_literal: true

# Knight class
class Knight
  MOVEMENT = [2, 1].freeze

  attr_accessor :loc

  def initialize(loc = [0, 0])
    @loc = loc
  end

  def moves # rubocop:disable Metrics/AbcSize
    [
      MOVEMENT,
      [MOVEMENT[1], MOVEMENT[0]],
      [-MOVEMENT[1], MOVEMENT[0]],
      [-MOVEMENT[0], MOVEMENT[1]],
      [-MOVEMENT[0], -MOVEMENT[1]],
      [-MOVEMENT[1], -MOVEMENT[0]],
      [MOVEMENT[1], -MOVEMENT[0]],
      [MOVEMENT[0], -MOVEMENT[1]]
    ]
  end

  def available_squares
    squares = []
    moves.each_index do |move|
      coords = [@loc[0] + moves[move][0], @loc[1] + moves[move][1]]
      squares << coords if valid_square?(coords)
    end
    squares
  end

  def valid_square?(coords)
    return true if coords[0].between?(0, 7) && coords[1].between?(0, 7)

    false
  end
end
