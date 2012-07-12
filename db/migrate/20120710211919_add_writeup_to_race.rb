class AddWriteupToRace < ActiveRecord::Migration
  def change
    add_column :races, :writeup, :text
  end
end
