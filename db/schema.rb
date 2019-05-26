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

ActiveRecord::Schema.define(version: 2019_04_23_014311) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.string "uuid", default: "uuid_generate_v4()"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["uuid"], name: "index_accounts_on_uuid", unique: true
  end

  create_table "calendars", force: :cascade do |t|
    t.bigint "group_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "account_id"
    t.index ["account_id"], name: "index_calendars_on_account_id"
    t.index ["group_id"], name: "index_calendars_on_group_id"
  end

  create_table "events", force: :cascade do |t|
    t.bigint "calendar_id"
    t.bigint "section_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "account_id"
    t.string "name"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.index ["account_id"], name: "index_events_on_account_id"
    t.index ["calendar_id"], name: "index_events_on_calendar_id"
    t.index ["section_id"], name: "index_events_on_section_id"
  end

  create_table "groups", force: :cascade do |t|
    t.integer "number"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "account_id"
    t.index ["account_id"], name: "index_groups_on_account_id"
  end

  create_table "sections", force: :cascade do |t|
    t.string "name"
    t.bigint "group_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "account_id"
    t.index ["account_id"], name: "index_sections_on_account_id"
    t.index ["group_id"], name: "index_sections_on_group_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "name"
    t.string "last_name"
    t.string "sur_name"
    t.string "cum"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "group_id"
    t.bigint "section_id"
    t.bigint "account_id"
    t.index ["account_id"], name: "index_users_on_account_id"
    t.index ["cum"], name: "index_users_on_cum", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["group_id"], name: "index_users_on_group_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["section_id"], name: "index_users_on_section_id"
  end

  add_foreign_key "calendars", "accounts"
  add_foreign_key "calendars", "groups"
  add_foreign_key "events", "accounts"
  add_foreign_key "events", "calendars"
  add_foreign_key "events", "sections"
  add_foreign_key "groups", "accounts"
  add_foreign_key "sections", "accounts"
  add_foreign_key "users", "accounts"
  add_foreign_key "users", "groups"
  add_foreign_key "users", "sections"
end
