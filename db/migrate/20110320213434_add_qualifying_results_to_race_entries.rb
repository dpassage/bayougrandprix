class AddQualifyingResultsToRaceEntries < ActiveRecord::Migration
  def self.up
    change_table :race_entries do |t|
      t.integer :qualify
      t.boolean :dnq
    end
    execute "update race_entries, qualresults 
             set race_entries.qualify = qualresults.place, 
                race_entries.dnq = qualresults.dnf  
             where race_entries.race_id = qualresults.race 
               and race_entries.driver_id = qualresults.driver"    
  end

  def self.down
    change_table :race_entries do |t|
      t.remove :qualify
      t.remove :dnq
    end
  end
end
