class Driver < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :player
  has_many :season_entries
  has_many :race_entries
  attr_accessible :name, :player

  def default_team_for_season(season)
    self.season_entries.where(:season_id => season.id).first.defaultteam
  end
end
