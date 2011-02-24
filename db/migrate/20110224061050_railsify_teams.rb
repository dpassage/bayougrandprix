class RailsifyTeams < ActiveRecord::Migration
  def self.up
    change_table :teams do |t|
      t.timestamps
    end
  end

  def self.down
    change_table :teams do |t|
      t.remove_timestamps
    end
  end
end
