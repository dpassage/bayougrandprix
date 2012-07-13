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

ActiveRecord::Schema.define(:version => 20120713190206) do

  create_table "drivers", :force => true do |t|
    t.integer  "player_id",                 :null => false
    t.string   "name",       :limit => 100, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", :force => true do |t|
    t.string   "name",       :limit => 100, :null => false
    t.string   "email",      :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "race_entries", :force => true do |t|
    t.integer  "race_id",         :null => false
    t.integer  "team_id",         :null => false
    t.integer  "finish"
    t.boolean  "dnf"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "qualify"
    t.boolean  "dnq"
    t.integer  "season_entry_id"
  end

  add_index "race_entries", ["race_id", "finish"], :name => "index_race_entries_on_race_id_and_finish", :unique => true

  create_table "races", :force => true do |t|
    t.integer  "track_id",   :null => false
    t.date     "date",       :null => false
    t.integer  "season_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "writeup"
  end

  create_table "scoring_schemes", :force => true do |t|
    t.string   "name",       :limit => 100, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "season_entries", :force => true do |t|
    t.integer "season_id",      :null => false
    t.integer "driver_id",      :null => false
    t.integer "defaultteam_id", :null => false
  end

  add_index "season_entries", ["season_id", "driver_id"], :name => "index_season_entries_on_season_id_and_driver_id", :unique => true

  create_table "seasons", :force => true do |t|
    t.string   "name",              :limit => 100,                :null => false
    t.integer  "scoring_scheme_id",                :default => 1, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", :force => true do |t|
    t.string   "name",       :limit => 100,                    :null => false
    t.string   "color",      :limit => 100
    t.boolean  "fake",                      :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tracks", :force => true do |t|
    t.string   "name",       :limit => 100, :null => false
    t.string   "country",    :limit => 100, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "number",                    :null => false
  end

end
