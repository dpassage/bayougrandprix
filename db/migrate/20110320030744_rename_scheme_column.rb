class RenameSchemeColumn < ActiveRecord::Migration
  def self.up
    change_table :seasons do |t|
      t.rename :scheme, :scoring_scheme_id
    end
  end

  def self.down
    change_table :seasons do |t|
      t.rename :scoring_scheme_id, :scheme
    end
  end
end
