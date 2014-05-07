# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140507095733) do

  create_table "client_phones", force: true do |t|
    t.integer  "client_id"
    t.string   "first_phone"
    t.string   "second_phone"
    t.string   "mobile"
    t.string   "fax"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "client_phones", ["client_id"], name: "index_client_phones_on_client_id", using: :btree

  create_table "clients", force: true do |t|
    t.string   "identity"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "street"
    t.integer  "street_number"
    t.string   "zip_code"
    t.string   "city"
    t.string   "credit_card_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hotel_phones", force: true do |t|
    t.integer  "hotel_id"
    t.string   "first_phone"
    t.string   "second_phone"
    t.string   "mobile"
    t.string   "fax"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hotel_phones", ["hotel_id"], name: "index_hotel_phones_on_hotel_id", using: :btree

  create_table "hotels", force: true do |t|
    t.string   "name"
    t.string   "street"
    t.integer  "street_number"
    t.string   "zip_code"
    t.string   "city"
    t.integer  "rating"
    t.integer  "construction_year"
    t.integer  "renovation_year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reservations", force: true do |t|
    t.integer  "hotel_id"
    t.integer  "room_id"
    t.integer  "client_id"
    t.string   "reservation_date"
    t.date     "arrival_date"
    t.date     "departure_date"
    t.string   "payment_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reservations", ["client_id"], name: "index_reservations_on_client_id", using: :btree
  add_index "reservations", ["hotel_id"], name: "index_reservations_on_hotel_id", using: :btree
  add_index "reservations", ["room_id"], name: "index_reservations_on_room_id", using: :btree

  create_table "rooms", force: true do |t|
    t.integer  "hotel_id"
    t.string   "room_type"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rooms", ["hotel_id"], name: "index_rooms_on_hotel_id", using: :btree

  create_table "upcoming_reservations", id: false, force: true do |t|
    t.integer  "id",             default: 0, null: false
    t.date     "arrival_date"
    t.date     "departure_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "name"
    t.string   "room_type"
  end

  create_table "upcoming_reservations_updatable", id: false, force: true do |t|
    t.integer  "id",               default: 0, null: false
    t.integer  "hotel_id"
    t.integer  "room_id"
    t.integer  "client_id"
    t.string   "reservation_date"
    t.date     "arrival_date"
    t.date     "departure_date"
    t.string   "payment_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
