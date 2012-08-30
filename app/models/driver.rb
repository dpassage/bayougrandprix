class Driver < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :player
  belongs_to :player
  has_many :driver_entries, :dependent => :restrict
  has_many :race_entries
  attr_accessible :name, :player_id

  def default_team_for_season(season)
    self.driver_entries.where(:season_id => season.id).first.defaultteam
  end
end
