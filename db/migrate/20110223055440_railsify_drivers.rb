class RailsifyDrivers < ActiveRecord::Migration
  def self.up
    change_table :drivers do |t|
      t.rename(:player, :player_id)
      t.timestamps
    end
  end

  def self.down
    change_table :drivers do |t|
      t.rename(:player_id, :player)
      t.remove_timestamps
    end
  end
end
