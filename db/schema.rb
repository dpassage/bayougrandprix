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

ActiveRecord::Schema.define(:version => 20110308061324) do

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

  create_table "qualresults", :id => false, :force => true do |t|
    t.integer "race",   :null => false
    t.integer "driver", :null => false
    t.integer "place",  :null => false
    t.boolean "dnf",    :null => false
  end

  create_table "race_entries", :force => true do |t|
    t.integer  "race_id"
    t.integer  "driver_id"
    t.integer  "team_id"
    t.integer  "finish"
    t.boolean  "dnf"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "raceresults", :id => false, :force => true do |t|
    t.integer "race",                      :null => false
    t.integer "driver",                    :null => false
    t.integer "place",                     :null => false
    t.boolean "dnf",    :default => false, :null => false
  end

  create_table "races", :force => true do |t|
    t.integer  "track_id",   :null => false
    t.date     "date",       :null => false
    t.integer  "season_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schedule", :id => false, :force => true do |t|
    t.integer "season", :null => false
    t.integer "race",   :null => false
  end

  create_table "scoring", :id => false, :force => true do |t|
    t.integer "place",  :null => false
    t.integer "points", :null => false
    t.integer "scheme"
  end

  create_table "scoringschemes", :force => true do |t|
    t.string "name", :limit => 100, :null => false
  end

  create_table "season_entries", :force => true do |t|
    t.integer "season_id",   :null => false
    t.integer "driver_id",   :null => false
    t.integer "defaultteam", :null => false
  end

  create_table "seasons", :force => true do |t|
    t.string   "name",       :limit => 100,                :null => false
    t.integer  "scheme",                    :default => 1, :null => false
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
  end

end
