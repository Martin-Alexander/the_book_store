# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_07_030632) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "book_stocks", force: :cascade do |t|
    t.bigint "book_store_id", null: false
    t.bigint "book_id", null: false
    t.integer "stock_level", default: 0, null: false
    t.boolean "in_stock", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_book_stocks_on_book_id"
    t.index ["book_store_id"], name: "index_book_stocks_on_book_store_id"
  end

  create_table "book_stores", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "books", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.integer "failed_attempts", default: 0, null: false
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "book_store_id"
    t.string "authentication_token", limit: 30
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["book_store_id"], name: "index_users_on_book_store_id"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "book_stocks", "book_stores"
  add_foreign_key "book_stocks", "books"
  add_foreign_key "users", "book_stores"
end
