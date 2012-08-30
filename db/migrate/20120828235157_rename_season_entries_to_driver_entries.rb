class RenameSeasonEntriesToDriverEntries < ActiveRecord::Migration
  def change
    rename_table("season_entries", "driver_entries")
    rename_column(:race_entries, :season_entry_id, :driver_entry_id)
  end
end
