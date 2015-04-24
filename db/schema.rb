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

ActiveRecord::Schema.define(version: 20150424082700) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.date     "starting_on"
    t.date     "ending_on"
    t.integer  "travellers"
    t.integer  "user_id"
    t.integer  "flat_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "accepted",    default: false
  end

  add_index "bookings", ["flat_id"], name: "index_bookings_on_flat_id", using: :btree
  add_index "bookings", ["user_id"], name: "index_bookings_on_user_id", using: :btree

  create_table "flats", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "price"
    t.string   "city"
    t.integer  "capacity"
    t.boolean  "availability"
    t.integer  "user_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "picture_1_file_name"
    t.string   "picture_1_content_type"
    t.integer  "picture_1_file_size"
    t.datetime "picture_1_updated_at"
    t.string   "picture_2_file_name"
    t.string   "picture_2_content_type"
    t.integer  "picture_2_file_size"
    t.datetime "picture_2_updated_at"
    t.string   "picture_3_file_name"
    t.string   "picture_3_content_type"
    t.integer  "picture_3_file_size"
    t.datetime "picture_3_updated_at"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "flats", ["user_id"], name: "index_flats_on_user_id", using: :btree

  create_table "pictures", force: :cascade do |t|
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "picture"
    t.string   "name"
    t.string   "token"
    t.datetime "token_expiry"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "bookings", "flats"
  add_foreign_key "bookings", "users"
  add_foreign_key "flats", "users"
end
