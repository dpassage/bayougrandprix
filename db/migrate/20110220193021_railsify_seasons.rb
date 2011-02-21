class RailsifySeasons < ActiveRecord::Migration
  def self.up
    change_table :seasons do |t|
      t.timestamps
    end
#    create_table :seasons do |t|
#      t.string :name

#      t.timestamps
#    end
  end

  def self.down
    change_table :seasons do |t|
      t.remove_timestamps
    end
  end
end
