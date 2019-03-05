class CreateBoardMoves < ActiveRecord::Migration[5.2]
  def change
    create_table :board_moves do |t|
      t.belongs_to :board, null: false, foreign_key: true
      t.string :position, null: false
      t.timestamps null: false
      t.index [:board_id, :position], unique: true
    end
  end
end
