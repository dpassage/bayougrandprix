class Race < ActiveRecord::Base
  belongs_to :track
  belongs_to :season
end
