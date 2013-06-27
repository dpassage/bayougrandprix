class Driver < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :player
  belongs_to :player
  has_many :driver_entries, :dependent => :restrict_with_exception
  has_many :race_entries

  def default_team_for_season(season)
    self.driver_entries.where(:season_id => season.id).first.defaultteam
  end
end
