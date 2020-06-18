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

ActiveRecord::Schema.define(version: 2020_06_16_155702) do

  create_table "book_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "video_url"
    t.string "author"
    t.integer "book_category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "img_url"
    t.index ["book_category_id"], name: "index_books_on_book_category_id"
  end

  create_table "favorite_books", force: :cascade do |t|
    t.integer "book_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_favorite_books_on_book_id"
    t.index ["user_id"], name: "index_favorite_books_on_user_id"
  end

  create_table "favorite_rhymes", force: :cascade do |t|
    t.integer "rhyme_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["rhyme_id"], name: "index_favorite_rhymes_on_rhyme_id"
    t.index ["user_id"], name: "index_favorite_rhymes_on_user_id"
  end

  create_table "rhyme_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rhymes", force: :cascade do |t|
    t.string "title"
    t.string "video_url"
    t.string "author"
    t.integer "rhyme_category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "img_url"
    t.index ["rhyme_category_id"], name: "index_rhymes_on_rhyme_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "name"
    t.integer "age"
    t.string "birthday"
    t.string "img_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "books", "book_categories"
  add_foreign_key "favorite_books", "books"
  add_foreign_key "favorite_books", "users"
  add_foreign_key "favorite_rhymes", "rhymes"
  add_foreign_key "favorite_rhymes", "users"
  add_foreign_key "rhymes", "rhyme_categories"
end
