class LinkRaceEntryToSeasonEntry < ActiveRecord::Migration
  def up
    # add a season_entries column
    change_table :race_entries do |t|
      t.references :season_entry
    end
    # populate new column
    execute <<-SQL
    update race_entries, season_entries, races 
      set race_entries.season_entry_id = season_entries.id 
      where race_entries.race_id = races.id and
        season_entries.season_id = races.season_id and
        season_entries.driver_id = race_entries.driver_id
    SQL
    remove_column :race_entries, :driver_id
  end

  def down
    change_table :race_entries do |t|
      t.references :driver
    end
    execute <<-SQL
    update race_entries, season_entries 
      set race_entries.driver_id = season_entries.driver_id 
      where race_entries.season_entry_id = season_entries.id
    SQL
    
    remove_column :race_entries, :season_entry_id
  end
end
