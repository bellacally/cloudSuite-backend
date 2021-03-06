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

ActiveRecord::Schema.define(version: 2018_11_23_020622) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "jets", force: :cascade do |t|
    t.integer "price_jet"
    t.string "location"
    t.string "model"
    t.string "photo"
    t.text "description"
    t.integer "capacity_of_passengers"
    t.string "manufactory"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "available_start_date"
    t.date "available_end_date"
    t.string "avatarurl"
    t.index ["user_id"], name: "index_jets_on_user_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.text "customized_request"
    t.boolean "status"
    t.date "start_date"
    t.date "end_date"
    t.string "destination"
    t.integer "number_of_passengers"
    t.string "passenger_identifications"
    t.float "total_price"
    t.bigint "user_id"
    t.bigint "jet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.time "start_time"
    t.time "end_time"
    t.index ["jet_id"], name: "index_reservations_on_jet_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.string "rating"
    t.bigint "reservation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reservation_id"], name: "index_reviews_on_reservation_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "identification"
    t.string "payment_method"
    t.string "name"
    t.string "email"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "openid"
  end

  add_foreign_key "jets", "users"
  add_foreign_key "reservations", "jets"
  add_foreign_key "reservations", "users"
  add_foreign_key "reviews", "reservations"
end
