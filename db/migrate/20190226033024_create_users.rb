class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false, index: {unique: true}
      t.string :password_digest
      t.string :uuid, null: false, index: {unique: true}
      t.timestamps null: false
    end
  end
end
