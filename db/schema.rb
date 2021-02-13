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

ActiveRecord::Schema.define(version: 2021_02_12_205947) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "citext"
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.citext "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_accounts_on_email"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "habit_logs", force: :cascade do |t|
    t.bigint "habit_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "logged_at", null: false
    t.date "logged_for", null: false
    t.index ["habit_id"], name: "index_habit_logs_on_habit_id"
  end

  create_table "habits", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.string "name", null: false
    t.integer "goal"
    t.integer "time_period", limit: 2
    t.date "start_date", null: false
    t.jsonb "reminders", default: [], null: false
    t.boolean "is_bad", null: false
    t.jsonb "repeat", default: {}, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "profile_id"
    t.index ["category_id"], name: "index_habits_on_category_id"
    t.index ["profile_id"], name: "index_habits_on_profile_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "account_id"
    t.string "username", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_profiles_on_account_id"
  end

  add_foreign_key "habit_logs", "habits"
  add_foreign_key "habits", "categories"
  add_foreign_key "habits", "profiles"
  add_foreign_key "profiles", "accounts"
end
