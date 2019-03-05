# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_03_08_081243) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "board_moves", force: :cascade do |t|
    t.bigint "board_id", null: false
    t.string "position", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id", "position"], name: "index_board_moves_on_board_id_and_position", unique: true
    t.index ["board_id"], name: "index_board_moves_on_board_id"
  end

  create_table "boards", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.bigint "user_id"
    t.boolean "cpu", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_boards_on_game_id"
    t.index ["user_id"], name: "index_boards_on_user_id"
  end

  create_table "games", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "piece_positions", force: :cascade do |t|
    t.bigint "board_id", null: false
    t.bigint "piece_id", null: false
    t.string "position", limit: 3, null: false
    t.boolean "hit", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id", "position"], name: "index_piece_positions_on_board_id_and_position", unique: true
    t.index ["board_id"], name: "index_piece_positions_on_board_id"
    t.index ["piece_id"], name: "index_piece_positions_on_piece_id"
  end

  create_table "pieces", force: :cascade do |t|
    t.bigint "board_id", null: false
    t.integer "psize", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id", "psize"], name: "index_pieces_on_board_id_and_psize", unique: true
    t.index ["board_id"], name: "index_pieces_on_board_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest"
    t.string "uuid", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["uuid"], name: "index_users_on_uuid", unique: true
  end

  add_foreign_key "board_moves", "boards"
  add_foreign_key "boards", "games"
  add_foreign_key "boards", "users"
  add_foreign_key "piece_positions", "boards"
  add_foreign_key "piece_positions", "pieces", on_delete: :cascade
  add_foreign_key "pieces", "boards"
end
