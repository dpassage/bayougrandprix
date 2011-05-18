class SeasonEntry < ActiveRecord::Base
  belongs_to :driver
  belongs_to :season
  belongs_to :defaultteam, :class_name => "Team", :foreign_key => "defaultteam"
  validates_presence_of :defaultteam
  validates_presence_of :driver
  validates_presence_of :season
end
