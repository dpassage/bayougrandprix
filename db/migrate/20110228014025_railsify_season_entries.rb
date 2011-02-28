class RailsifySeasonEntries < ActiveRecord::Migration
  def self.up
    rename_table :seasondrivers, :season_entries
    add_column :season_entries, :id, :primary_key
    rename_column :season_entries, :season, :season_id
    rename_column :season_entries, :driver, :driver_id
  end

  def self.down
    rename_column :season_entries, :driver_id, :driver
    rename_column :season_entries, :season_id, :season
    remove_column :season_entries, :id
    rename_table :season_entries, :seasondrivers
  end
end
