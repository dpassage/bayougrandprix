class RailsifyRaceEntries < ActiveRecord::Migration
  def self.up
    # rename racedrivers to race_entries
    rename_table :racedrivers, :race_entries

    change_table :race_entries do |t|
      t.column :id, :primary_key
      # rename columns to match _id format
      t.rename :race, :race_id
      t.rename :driver, :driver_id
      t.rename :team, :team_id
      # add finish finish and dnf columns
      t.integer :finish
      t.boolean :dnf

      t.timestamps
    end
    # populate new columns from raceresults
    execute "update race_entries, raceresults
             set race_entries.finish = raceresults.place,
                race_entries.dnf = raceresults.dnf
             where race_entries.race_id = raceresults.race
               and race_entries.driver_id = raceresults.driver"

  end

  def self.down
    change_table :race_entries do |t|
      t.remove_timestamps
      t.remove :dnf
      t.remove :finish
      t.rename :team_id, :team
      t.rename :driver_id, :driver
      t.rename :race_id, :race
      t.remove :id
    end
    rename_table :race_entries, :racedrivers
  end
end
