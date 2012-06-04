class AddUniqueIndicesToRaceEntries < ActiveRecord::Migration
  def change
    change_table :race_entries do |t|
      t.index([:race_id, :finish], :unique => true)    
    end
  end
end
