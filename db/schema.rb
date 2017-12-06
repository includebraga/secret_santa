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

ActiveRecord::Schema.define(version: 20171206145156) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "instituitions", force: :cascade do |t|
    t.string "name"
    t.string "short_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.integer "user_id"
    t.integer "receiver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "receiver_id"], name: "index_matches_on_user_id_and_receiver_id"
  end

  create_table "receivers", force: :cascade do |t|
    t.string "name"
    t.text "letter"
    t.bigint "instituition_id"
    t.integer "matched_gifts"
    t.integer "received_gifts"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["instituition_id"], name: "index_receivers_on_instituition_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.datetime "confirmed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "confirmation_token"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "receivers", "instituitions"
end
