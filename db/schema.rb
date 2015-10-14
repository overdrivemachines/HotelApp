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

ActiveRecord::Schema.define(version: 20151014191111) do

  create_table "guests", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "city"
    t.string   "zip"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "id_type"
    t.date     "dob"
    t.string   "id_state"
    t.string   "id_number"
    t.string   "email"
    t.integer  "reservation_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "guests", ["reservation_id"], name: "index_guests_on_reservation_id"

  create_table "properties", force: :cascade do |t|
    t.string   "name"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.string   "fax"
    t.string   "email"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "property_id"
    t.date     "arrival_date"
    t.date     "departure_date"
    t.integer  "adults"
    t.integer  "children"
    t.integer  "room_type_id"
    t.integer  "room_id"
    t.float    "rate"
    t.text     "notes"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "access_code"
  end

  add_index "reservations", ["property_id"], name: "index_reservations_on_property_id"
  add_index "reservations", ["room_id"], name: "index_reservations_on_room_id"
  add_index "reservations", ["room_type_id"], name: "index_reservations_on_room_type_id"

  create_table "room_types", force: :cascade do |t|
    t.integer  "property_id"
    t.string   "code"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "room_types", ["property_id"], name: "index_room_types_on_property_id"

  create_table "rooms", force: :cascade do |t|
    t.integer  "property_id"
    t.integer  "room_number"
    t.integer  "room_type_id"
    t.string   "location"
    t.integer  "status"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "rooms", ["property_id"], name: "index_rooms_on_property_id"
  add_index "rooms", ["room_type_id"], name: "index_rooms_on_room_type_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "firstname"
    t.string   "lastname"
    t.integer  "property_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["property_id"], name: "index_users_on_property_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
