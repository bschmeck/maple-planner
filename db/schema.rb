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

ActiveRecord::Schema.define(version: 2024_10_31_212703) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collaborations", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "year_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "days", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "week_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "date"
  end

  create_table "items", id: :serial, force: :cascade do |t|
    t.string "text", limit: 1048576
    t.string "url"
    t.integer "day_id"
    t.integer "grade"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "row_id"
  end

  create_table "rows", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.integer "year_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "order", default: 100
  end

  create_table "shares", id: :serial, force: :cascade do |t|
    t.string "code", null: false
    t.string "description"
    t.datetime "expiration"
    t.integer "year_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "weeks", id: :serial, force: :cascade do |t|
    t.integer "number"
    t.datetime "start_date"
    t.integer "year_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "years", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "user_id"
  end

end
