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

ActiveRecord::Schema.define(version: 20171210112738) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "institutions", force: :cascade do |t|
    t.string "name"
    t.string "short_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["short_name"], name: "index_institutions_on_short_name", unique: true
  end

  create_table "matches", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "receiver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "email_sent", default: false
    t.index ["receiver_id"], name: "index_matches_on_receiver_id"
    t.index ["user_id", "receiver_id"], name: "index_matches_on_user_id_and_receiver_id", unique: true
    t.index ["user_id"], name: "index_matches_on_user_id"
  end

  create_table "receivers", force: :cascade do |t|
    t.string "name"
    t.text "letter"
    t.bigint "institution_id"
    t.integer "matched_gifts", default: 0
    t.integer "received_gifts", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "golden", default: false
    t.integer "gender", default: 0
    t.integer "age"
    t.index ["institution_id"], name: "index_receivers_on_institution_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.datetime "confirmed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "confirmation_token"
    t.string "redeem_token"
    t.boolean "match_notice_sent", default: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["redeem_token"], name: "index_users_on_redeem_token", unique: true
  end

  add_foreign_key "matches", "receivers"
  add_foreign_key "matches", "users"
  add_foreign_key "receivers", "institutions"
end
