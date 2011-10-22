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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111021001326) do

  create_table "bagtypes", :force => true do |t|
    t.integer  "size"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
  end

  create_table "interactions", :force => true do |t|
    t.float    "Loclatitude"
    t.float    "loclongitude"
    t.integer  "PersonA"
    t.integer  "PersonB"
    t.datetime "Timestamp"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "deltime"
  end

  create_table "item_descriptions", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "rarity"
    t.integer  "image_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_histories", :force => true do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "signature"
    t.datetime "stamp"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "runningdistance"
  end

  create_table "items", :force => true do |t|
    t.integer  "user_id"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "item_description_id"
  end

  create_table "locations", :force => true do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "timestamp"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.integer  "age"
    t.integer  "sex"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.integer  "bagtype_id"
    t.text     "api_key"
    t.string   "user_type",       :default => "normal", :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
