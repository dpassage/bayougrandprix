class FixTracksPrimaryKey < ActiveRecord::Migration
  def up
    # add the number column
    add_column :tracks, :number, :integer
    # populate it from the id column
    Track.all.each do |track|
      track.number = track.id
      track.save!
    end
    change_column :tracks, :number, :integer, :null => false
    # drop the id column
    remove_column :tracks, :id
    # add new id primary key
    add_column :tracks, :id, :primary_key
  end

  def down
    # because this fixes a bug in the database introduced in the conversion from mysql,
    # rather than try to re-introduce the same bug, prevent migrating backwards past
    # this point.
    raise ActiveRecord::IrreversibleMigration
  end
end
