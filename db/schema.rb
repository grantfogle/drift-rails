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

ActiveRecord::Schema.define(version: 2024_02_19_043406) do

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "flow_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["flow_id"], name: "index_favorites_on_flow_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "flows", force: :cascade do |t|
    t.text "name"
    t.text "location"
    t.integer "flow"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status"
    t.string "stream"
    t.integer "usgs_id"
    t.string "state"
  end

  create_table "reports", force: :cascade do |t|
    t.string "author"
    t.text "body"
    t.integer "rating"
    t.integer "flow_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status"
    t.index ["flow_id"], name: "index_reports_on_flow_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "favorites", "flows"
  add_foreign_key "favorites", "users"
  add_foreign_key "reports", "flows"
end
