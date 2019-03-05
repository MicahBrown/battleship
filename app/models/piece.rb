class Piece < ApplicationRecord
  belongs_to :board
  has_many :piece_positions

  SIZES = (2..5).to_a.freeze

  def position_conflict?
    other_positions = self.board.piece_positions.reload
    positions = self.piece_positions
    positions.any? { |pos| other_positions.map(&:position).include?(pos.position) }
  end

  def randomize_position(psize)
    dir = [:x, :y].sample

    x_axis = Board::X_AXIS
    y_axis = Board::Y_AXIS

    x1 = x_axis.sample
    y1 = y_axis.sample

    x2 = dir == :x ? get_valid_endpoint(x1, x_axis, psize) : x1
    y2 = dir == :y ? get_valid_endpoint(y1, y_axis, psize) : y1

    coords = dir == :y ? [y1, y2].sort : [x1, x2].sort

    positions = (coords[0]..coords[1]).to_a.map { |v| dir == :y ? "#{x1}#{v}" : "#{v}#{y1}" }

    self.piece_positions = positions.map { |pos| PiecePosition.new(piece: self, position: pos, board: board) }
    self.psize = psize

    true
  end

  def get_valid_endpoint(start, axis, psize)
    amnt = psize - 1
    idx = axis.index(start)

    val = [idx, amnt].inject([:+, :-].sample)
    val = [idx, amnt].inject(:+) if val < 0
    val = [idx, amnt].inject(:-) if val > (axis.size - 1)

    axis[val]
  end

  def color
    case psize
    when 2 then 'blue'
    when 3 then 'purple'
    when 4 then 'green'
    when 5 then 'yellow'
    end
  end
end
