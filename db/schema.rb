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

ActiveRecord::Schema.define(version: 20170910181330) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "daily_changes", force: :cascade do |t|
    t.bigint "product_id"
    t.json "changes_made"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_daily_changes_on_product_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.bigint "group_id"
    t.string "amazon_asin"
    t.string "amazon_url"
    t.string "reviews_url"
    t.string "price"
    t.string "currency_code"
    t.string "title"
    t.integer "number_of_reviews"
    t.integer "best_seller_rank"
    t.integer "inventory"
    t.text "features", default: [], array: true
    t.text "image_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_products_on_group_id"
  end

  add_foreign_key "daily_changes", "products"
  add_foreign_key "products", "groups"
end
