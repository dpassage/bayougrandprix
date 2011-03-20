class RailsifyScoringSchemes < ActiveRecord::Migration
  def self.up
    rename_table :scoringschemes, :scoring_schemes
    change_table :scoring_schemes do |t|
      t.timestamps
    end
  end

  def self.down
    change_table :scoring_schemes do |t|
      t.remove_timestamps
    end
    rename_table :scoring_schemes, :scoringschemes
  end
end
