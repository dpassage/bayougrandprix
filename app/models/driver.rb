class Driver < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :player
  has_many :season_entries
end
