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

ActiveRecord::Schema[8.1].define(version: 2026_04_16_205628) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "availabilities", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "date"
    t.time "end_time"
    t.time "start_time"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_availabilities_on_user_id"
  end

  create_table "bookers", force: :cascade do |t|
    t.string "booker_type"
    t.datetime "created_at", null: false
    t.string "email"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "availability_id", null: false
    t.bigint "booker_id", null: false
    t.datetime "created_at", null: false
    t.integer "duration"
    t.string "interview_type"
    t.time "start_time"
    t.string "status"
    t.datetime "updated_at", null: false
    t.index ["availability_id"], name: "index_bookings_on_availability_id"
    t.index ["booker_id"], name: "index_bookings_on_booker_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "regions", force: :cascade do |t|
    t.bigint "country_id", null: false
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_regions_on_country_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "password_digest"
    t.bigint "region_id", null: false
    t.string "role"
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_users_on_region_id"
  end

  add_foreign_key "availabilities", "users"
  add_foreign_key "bookings", "availabilities"
  add_foreign_key "bookings", "bookers"
  add_foreign_key "regions", "countries"
  add_foreign_key "users", "regions"
end
