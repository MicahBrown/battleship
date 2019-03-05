class CreatePieces < ActiveRecord::Migration[5.2]
  def change
    create_table :pieces do |t|
      t.belongs_to :board, null: false, foreign_key: true
      t.integer :psize, null: false, default: 0
      t.timestamps null: false
      t.index [:board_id, :psize], unique: true
    end
  end
end
