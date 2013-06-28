class Race < ActiveRecord::Base
  belongs_to :track
  belongs_to :season
  has_many :race_entries, dependent: :restrict_with_exception
  validates_presence_of :track, :season, :date
  accepts_nested_attributes_for :race_entries

  def points_for_finishing(place)
    self.season.points_for_finishing(place)
  end
end
