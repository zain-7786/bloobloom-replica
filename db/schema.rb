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

ActiveRecord::Schema.define(version: 2022_10_06_034734) do

  create_table "frames", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.integer "status", default: 0, null: false
    t.float "price", default: 0.0, null: false
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_frames_on_user_id"
  end

  create_table "lenses", force: :cascade do |t|
    t.string "color", null: false
    t.text "description", null: false
    t.integer "prescription_type", default: 0, null: false
    t.integer "lens_type", default: 0, null: false
    t.integer "stock", default: 0, null: false
    t.float "price", default: 0.0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "contact_number", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "frames", "users"
end
