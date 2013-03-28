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

ActiveRecord::Schema.define(:version => 20130328172650) do

  create_table "app_keys", :force => true do |t|
    t.string   "app"
    t.text     "app_url"
    t.string   "entity_name"
    t.datetime "last_processed"
    t.string   "is_pending"
    t.datetime "last_requested_processing"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "feed_entries", :force => true do |t|
    t.integer  "app_key_id"
    t.string   "name"
    t.text     "summary"
    t.string   "url"
    t.datetime "published_at"
    t.string   "guid"
    t.boolean  "is_star",         :default => false
    t.boolean  "is_to_read",      :default => false
    t.datetime "last_clicked_on"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "feed_entries", ["app_key_id", "created_at"], :name => "index_feed_entries_on_app_key_id_and_created_at"
  add_index "feed_entries", ["is_star", "created_at"], :name => "index_feed_entries_on_is_star_and_created_at"
  add_index "feed_entries", ["is_to_read", "created_at"], :name => "index_feed_entries_on_is_to_read_and_created_at"

end
