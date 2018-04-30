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

ActiveRecord::Schema.define(version: 20180430061634) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "post_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "causes", force: :cascade do |t|
    t.string "image"
    t.string "name"
    t.string "website"
    t.text "about"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "causes_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "cause_id", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "image"
    t.string "title"
    t.string "date"
    t.string "time"
    t.text "about"
    t.bigint "user_id"
    t.bigint "venue_id"
    t.bigint "cause_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cause_id"], name: "index_events_on_cause_id"
    t.index ["user_id"], name: "index_events_on_user_id"
    t.index ["venue_id"], name: "index_events_on_venue_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "image"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone_number"
    t.text "bio"
    t.bigint "area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_users_on_area_id"
  end

  create_table "venues", force: :cascade do |t|
    t.string "image"
    t.string "name"
    t.string "phone_number"
    t.string "email"
    t.string "website"
    t.string "style"
    t.text "about"
    t.string "street_address"
    t.bigint "area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_venues_on_area_id"
  end

  add_foreign_key "events", "causes"
  add_foreign_key "events", "users"
  add_foreign_key "events", "venues"
  add_foreign_key "users", "areas"
  add_foreign_key "venues", "areas"
end
