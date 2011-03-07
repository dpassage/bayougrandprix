class RailsifyTracks < ActiveRecord::Migration
  def self.up
    change_table :tracks do |t|
      t.timestamps
    end
  end

  def self.down
    change_table :tracks do |t|
      t.remove_timestamps
    end
  end
end
