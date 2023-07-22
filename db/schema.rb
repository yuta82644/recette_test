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

ActiveRecord::Schema.define(version: 2023_07_22_061103) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cooking_ingredients", force: :cascade do |t|
    t.text "ingredient_name"
    t.text "unit"
    t.integer "quantity"
    t.bigint "recipe_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recipe_id"], name: "index_cooking_ingredients_on_recipe_id"
  end

  create_table "procedures", force: :cascade do |t|
    t.text "procedure_comment"
    t.bigint "recipe_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recipe_id"], name: "index_procedures_on_recipe_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "title"
    t.text "short_comment"
    t.text "image"
    t.text "tortal_quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "room_id"
    t.boolean "public", default: true
  end

  create_table "room_assigns", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "room_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["room_id"], name: "index_room_assigns_on_room_id"
    t.index ["user_id"], name: "index_room_assigns_on_user_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.text "introduction"
    t.integer "owner_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "cooking_ingredients", "recipes"
  add_foreign_key "procedures", "recipes"
  add_foreign_key "room_assigns", "rooms"
  add_foreign_key "room_assigns", "users"
end
