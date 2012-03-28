class Race < ActiveRecord::Base
  belongs_to :track
  belongs_to :season
  has_many :race_entries
  validates_presence_of :track, :season, :date
  attr_accessible :track, :season, :date
  
  def points_for_finishing(place)
    self.season.points_for_finishing(place)
  end
end
