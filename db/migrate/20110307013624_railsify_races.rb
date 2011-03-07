class RailsifyRaces < ActiveRecord::Migration
  def self.up
    # add a season column
    change_table :races do |t|
      t.rename :track, :track_id
      t.references :season
      t.timestamps
    end
    # populate new column
    execute "update races, schedule  set races.season_id = schedule.season where races.id = schedule.race"
  end

  def self.down
    change_table :races do |t|
      t.remove_timestamps
      t.rename :track_id, :track
      t.remove_references :season
    end
  end
end
