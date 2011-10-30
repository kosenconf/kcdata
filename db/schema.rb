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

ActiveRecord::Schema.define(:version => 20111030131527) do

  create_table "events", :force => true do |t|
    t.string   "serial",                     :null => false
    t.string   "name",                       :null => false
    t.string   "description"
    t.string   "url"
    t.integer  "turnout",     :default => 0
    t.string   "place"
    t.string   "address"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["serial"], :name => "index_events_on_serial", :unique => true

  create_table "relations", :force => true do |t|
    t.boolean  "attendee",   :default => false
    t.boolean  "staff",      :default => false
    t.boolean  "speaker",    :default => false
    t.boolean  "online",     :default => false
    t.integer  "user_id",                       :null => false
    t.integer  "event_id",                      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relations", ["event_id"], :name => "index_relations_on_event_id"
  add_index "relations", ["user_id", "event_id"], :name => "index_relations_on_user_id_and_event_id", :unique => true
  add_index "relations", ["user_id"], :name => "index_relations_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name",              :null => false
    t.string   "provider",          :null => false
    t.string   "uid",               :null => false
    t.string   "profile_image_url", :null => false
    t.string   "access_token",      :null => false
    t.string   "access_secret",     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["name"], :name => "index_users_on_name", :unique => true
  add_index "users", ["provider", "uid"], :name => "index_users_on_provider_and_uid", :unique => true

end
