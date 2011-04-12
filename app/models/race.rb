class Race < ActiveRecord::Base
  belongs_to :track
  belongs_to :season
  has_many :race_entries
  validates_presence_of :track, :season, :date
end
