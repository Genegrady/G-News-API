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

ActiveRecord::Schema.define(version: 2020_01_17_145133) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "news", force: :cascade do |t|
    t.string "author"
    t.string "title"
    t.string "description"
    t.string "url"
    t.string "urlToImage"
    t.datetime "publishedAt"
    t.string "content"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_news_on_user_id"
  end

  create_table "searches", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "query"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_searches_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "username"
    t.string "password_digest"
    t.string "role", default: "user", null: false
    t.datetime "last_login"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "avatar"
    t.index ["password_digest"], name: "index_users_on_password_digest"
  end

  add_foreign_key "news", "users"
  add_foreign_key "searches", "users"
end
