class RailsifyDefaultTeamId < ActiveRecord::Migration
  def self.up
    rename_column :season_entries, :defaultteam, :defaultteam_id
  end

  def self.down
    rename_column :season_entries, :defaultteam_id, :defaultteam
  end
end
