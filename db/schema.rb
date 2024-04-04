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

ActiveRecord::Schema[7.0].define(version: 2024_04_02_145007) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "allergens", force: :cascade do |t|
    t.string "name"
    t.jsonb "found_in", default: "{}", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.string "upc_code"
    t.string "ingredients", default: [], array: true
    t.string "allergens", default: [], array: true
    t.boolean "lily_eat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_allergens", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "allergen_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["allergen_id"], name: "index_user_allergens_on_allergen_id"
    t.index ["user_id", "allergen_id"], name: "index_user_allergens_on_user_id_and_allergen_id", unique: true
    t.index ["user_id"], name: "index_user_allergens_on_user_id"
  end

  create_table "user_foods", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "food_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_id"], name: "index_user_foods_on_food_id"
    t.index ["user_id"], name: "index_user_foods_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "user_allergens", "allergens"
  add_foreign_key "user_allergens", "users"
  add_foreign_key "user_foods", "foods"
  add_foreign_key "user_foods", "users"
end
