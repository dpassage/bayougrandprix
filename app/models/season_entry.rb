class SeasonEntry < ActiveRecord::Base
  belongs_to :driver
  belongs_to :season
  belongs_to :defaultteam, :class_name => "Team", :foreign_key => "defaultteam"
end
