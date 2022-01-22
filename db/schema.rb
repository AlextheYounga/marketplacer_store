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

ActiveRecord::Schema.define(version: 2022_01_22_015502) do

  create_table "draft_order_lines", force: :cascade do |t|
    t.integer "draft_order_id"
    t.integer "product_id"
    t.string "name"
    t.string "title"
    t.decimal "price", precision: 64, scale: 12
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["draft_order_id"], name: "index_draft_order_lines_on_draft_order_id"
    t.index ["product_id"], name: "index_draft_order_lines_on_product_id"
  end

  create_table "draft_orders", force: :cascade do |t|
    t.string "order_number"
    t.string "cart_token"
    t.integer "promotion_id"
    t.string "name"
    t.string "email"
    t.string "currency"
    t.decimal "subtotal_price", precision: 64, scale: 12
    t.decimal "total_discounts", precision: 64, scale: 12
    t.decimal "total_price", precision: 64, scale: 12
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["promotion_id"], name: "index_draft_orders_on_promotion_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "uuid"
    t.string "name"
    t.decimal "price", precision: 64, scale: 12
    t.string "product_image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "promotions", force: :cascade do |t|
    t.string "name"
    t.string "discount_code"
    t.float "discount_amount"
    t.decimal "price_floor"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
