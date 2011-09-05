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

ActiveRecord::Schema.define(:version => 20110905201328) do

  create_table "bugs", :force => true do |t|
    t.boolean  "active"
    t.float    "infectionprob"
    t.integer  "lifespan"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "infectionatorrequest", :force => true do |t|
    t.integer  "bug_id"
    t.integer  "submitter_id"
    t.datetime "start_time"
    t.datetime "stop_time"
    t.datetime "submitted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "infectionatorrequest_user", :id => false, :force => true do |t|
    t.integer "request_id"
    t.integer "user_id"
  end

  create_table "interactions", :force => true do |t|
    t.float    "Loclatitude"
    t.float    "loclongitude"
    t.integer  "LocationType"
    t.integer  "PersonA"
    t.integer  "PersonB"
    t.datetime "Timestamp"
    t.datetime "deltime"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", :force => true do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "timestamp"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locationtypes", :force => true do |t|
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.integer  "age"
    t.integer  "sex"
    t.string   "passwordhash"
    t.string   "phoneinformation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
