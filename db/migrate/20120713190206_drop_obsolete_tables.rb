class DropObsoleteTables < ActiveRecord::Migration
  def up
    # These tables are left over from the old php-based system and can now die.
    drop_table 'qualresults'
    drop_table 'raceresults'
    drop_table 'schedule'
    drop_table 'scoring'
  end

  def down
    # Data's gone, not worth reproducing it as it's not needed.
    raise ActiveRecord::IrreversibleMigration
  end
end
