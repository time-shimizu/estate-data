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

ActiveRecord::Schema.define(version: 2020_11_28_065500) do

  create_table "buyinfos", force: :cascade do |t|
    t.string "address"
    t.float "lat"
    t.float "lng"
    t.integer "lowest_price"
    t.integer "highest_price"
    t.float "lowest_area"
    t.float "highest_area"
    t.integer "kind", default: 0, null: false
    t.string "name"
    t.string "meeting"
    t.string "memo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "distances", force: :cascade do |t|
    t.integer "sellinfo_id"
    t.integer "buyinfo_id"
    t.float "distance"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["buyinfo_id"], name: "index_distances_on_buyinfo_id"
    t.index ["sellinfo_id"], name: "index_distances_on_sellinfo_id"
  end

  create_table "sellinfos", force: :cascade do |t|
    t.string "address"
    t.integer "price"
    t.float "area"
    t.float "lat"
    t.float "lng"
    t.string "yield"
    t.string "name"
    t.string "meeting"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "kind", default: 0, null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
