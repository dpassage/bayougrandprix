class Legacyschema < ActiveRecord::Migration
  def self.up
    create_table "drivers", :force => true do |t|
       t.integer "player",                :null => false
       t.string  "name",   :limit => 100, :null => false
     end

     create_table "players", :force => true do |t|
       t.string "name",  :limit => 100, :null => false
       t.string "email", :limit => 100
     end

     create_table "qualresults", :id => false, :force => true do |t|
       t.integer "race",   :null => false
       t.integer "driver", :null => false
       t.integer "place",  :null => false
       t.boolean "dnf",    :null => false
     end

     create_table "racedrivers", :id => false, :force => true do |t|
       t.integer "race",   :null => false
       t.integer "driver", :null => false
       t.integer "team",   :null => false
     end

     create_table "raceresults", :id => false, :force => true do |t|
       t.integer "race",                      :null => false
       t.integer "driver",                    :null => false
       t.integer "place",                     :null => false
       t.boolean "dnf",    :default => false, :null => false
     end

     create_table "races", :force => true do |t|
       t.integer "track", :null => false
       t.date    "date",  :null => false
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

     create_table "seasondrivers", :id => false, :force => true do |t|
       t.integer "season",      :null => false
       t.integer "driver",      :null => false
       t.integer "defaultteam", :null => false
     end

     create_table "seasons", :force => true do |t|
       t.string  "name",   :limit => 100,                :null => false
       t.integer "scheme",                :default => 1, :null => false
     end

     create_table "teams", :force => true do |t|
       t.string  "name",  :limit => 100,                    :null => false
       t.string  "color", :limit => 100
       t.boolean "fake",                 :default => false, :null => false
     end

     create_table "tracks", :force => true do |t|
       t.string "name",    :limit => 100, :null => false
       t.string "country", :limit => 100, :null => false
     end
  end

  def self.down
  end
end
