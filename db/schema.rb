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

ActiveRecord::Schema.define(version: 2022_03_08_031338) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "meal_orders", force: :cascade do |t|
    t.bigint "meal_id", null: false
    t.bigint "order_id", null: false
    t.integer "quantity_ordered"
    t.float "total_price"
    t.datetime "pick_up"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["meal_id"], name: "index_meal_orders_on_meal_id"
    t.index ["order_id"], name: "index_meal_orders_on_order_id"
  end

  create_table "meals", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.float "price"
    t.text "description"
    t.datetime "shelf_life_end"
    t.datetime "collection_from"
    t.datetime "collection_to"
    t.integer "available_quantity"
    t.string "cuisine"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_meals_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.boolean "is_paid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_completed"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.integer "rating"
    t.bigint "meal_order_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["meal_order_id"], name: "index_reviews_on_meal_order_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "address"
    t.string "phone_number"
    t.string "name"
    t.float "overall_rating", default: 0.0
    t.boolean "food_safety_certified"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "meal_orders", "meals"
  add_foreign_key "meal_orders", "orders"
  add_foreign_key "meals", "users"
  add_foreign_key "orders", "users"
  add_foreign_key "reviews", "meal_orders"
end
