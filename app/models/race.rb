class Race < ActiveRecord::Base
  belongs_to :track
  belongs_to :season
  has_many :race_entries
end
