class RaceEntry < ActiveRecord::Base
  belongs_to :race
  belongs_to :driver
  belongs_to :team
end
