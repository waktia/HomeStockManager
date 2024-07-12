# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_07_12_120134) do
  create_table "item_maintags", force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "maintag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_item_maintags_on_item_id"
    t.index ["maintag_id"], name: "index_item_maintags_on_maintag_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.integer "stock"
    t.integer "days"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "main_category_id"
    t.index ["main_category_id"], name: "index_items_on_main_category_id"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "main_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_main_categories_on_user_id"
  end

  create_table "main_tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "item_maintags", "items"
  add_foreign_key "item_maintags", "maintags"
  add_foreign_key "items", "main_categories"
  add_foreign_key "items", "users"
  add_foreign_key "main_categories", "users"
end
