class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.belongs_to :game, null: false, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.boolean :cpu, null: false, default: false
      t.timestamps null: false
    end
  end
end
