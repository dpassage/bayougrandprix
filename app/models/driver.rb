class Driver < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :player
  has_many :season_entries, :dependent => :restrict
  has_many :race_entries
  attr_accessible :name, :player_id
  validate :player_must_exist
  
  def player_must_exist
    if !Player.exists?(player_id)
      errors.add(:player_id, "must exist")
    end
  end
  

  def default_team_for_season(season)
    self.season_entries.where(:season_id => season.id).first.defaultteam
  end
end
