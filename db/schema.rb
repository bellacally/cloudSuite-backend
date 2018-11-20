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

ActiveRecord::Schema.define(version: 2018_11_20_034535) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "jets", force: :cascade do |t|
    t.string "price_jet"
    t.string "location"
    t.string "model"
    t.string "photo"
    t.string "description"
    t.string "capacity_of_passengers"
    t.string "category"
    t.string "manufactory"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "available_start_date"
    t.string "available_end_date"
    t.index ["user_id"], name: "index_jets_on_user_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.string "customized_request"
    t.string "status"
    t.string "start_date"
    t.string "end_date"
    t.string "destination"
    t.string "number_of_passengers"
    t.string "passenger_identifications"
    t.string "total_price"
    t.bigint "user_id"
    t.bigint "jet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "start_time"
    t.integer "end_time"
    t.index ["jet_id"], name: "index_reservations_on_jet_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "content"
    t.string "rating"
    t.string "photo"
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
  end

  add_foreign_key "jets", "users"
  add_foreign_key "reservations", "jets"
  add_foreign_key "reservations", "users"
  add_foreign_key "reviews", "reservations"
end
