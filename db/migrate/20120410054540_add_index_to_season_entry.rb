class AddIndexToSeasonEntry < ActiveRecord::Migration
  def change
    change_table :season_entries do |t|
      t.index([:season_id, :driver_id], :unique => true)    
    end
  end
end
