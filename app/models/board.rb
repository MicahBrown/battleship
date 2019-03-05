class Board < ApplicationRecord
  X_AXIS = ("A".."L").to_a.freeze
  Y_AXIS = (1..12).to_a.freeze

  belongs_to :game
  belongs_to :user, optional: true
  has_many :pieces
  has_many :piece_positions
  has_many :board_moves

  after_save :trigger_hits!

  def trigger_hits!
    raise self.inspect
  end

  def randomize_pieces!
    sizes = Piece::SIZES
    sizes.each do |psize|
      piece = self.pieces.build
      piece.randomize_position(psize)
      piece.randomize_position(psize) while piece.position_conflict?
      piece.save!
    end
  end
end
