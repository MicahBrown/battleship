class PiecePosition < ApplicationRecord
  belongs_to :board
  belongs_to :piece
end
