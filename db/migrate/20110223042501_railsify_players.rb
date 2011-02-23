class RailsifyPlayers < ActiveRecord::Migration
  def self.up
    change_table :players do |t|

      t.timestamps
    end
  end

  def self.down
    change_table :players do |t|
      t.remove_timestamps
    end
  end
end
