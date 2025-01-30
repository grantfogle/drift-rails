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

ActiveRecord::Schema.define(version: 2025_01_30_015924) do

  create_table "favorite_streams", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "stream_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["stream_id"], name: "index_favorite_streams_on_stream_id"
    t.index ["user_id", "stream_id"], name: "index_favorite_streams_on_user_id_and_stream_id", unique: true
    t.index ["user_id"], name: "index_favorite_streams_on_user_id"
  end

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

  create_table "stream_flows", force: :cascade do |t|
    t.integer "stream_id", null: false
    t.integer "flow_rate", null: false
    t.datetime "measured_at", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["measured_at"], name: "index_stream_flows_on_measured_at"
    t.index ["stream_id"], name: "index_stream_flows_on_stream_id"
  end

  create_table "streams", force: :cascade do |t|
    t.string "state"
    t.string "usgs_id"
    t.string "watershed"
    t.string "watershed_id"
    t.string "usgs_stream_name"
    t.string "stream_name"
    t.string "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "favorite_streams", "streams"
  add_foreign_key "favorite_streams", "users"
  add_foreign_key "favorites", "flows"
  add_foreign_key "favorites", "users"
  add_foreign_key "reports", "flows"
  add_foreign_key "stream_flows", "streams"
end
