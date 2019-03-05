class CreatePiecePositions < ActiveRecord::Migration[5.2]
  def change
    create_table :piece_positions do |t|
      t.belongs_to :board, null: false, foreign_key: true
      t.belongs_to :piece, null: false, foreign_key: {on_delete: :cascade}
      t.string :position, limit: 3, null: false
      t.boolean :hit, default: false, null: false
      t.timestamps null: false
      t.index [:board_id, :position], unique: true
    end
  end
end
