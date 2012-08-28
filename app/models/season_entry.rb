class SeasonEntry < ActiveRecord::Base
  belongs_to :driver
  belongs_to :season
  belongs_to :defaultteam, :class_name => "Team", :foreign_key => "defaultteam_id"
  has_many :race_entries, :dependent => :restrict
  validates_presence_of :defaultteam
  validates_presence_of :driver
  validates_presence_of :season
  attr_accessible :defaultteam_id, :driver_id, :season_id

  def finish_points
    self.race_entries.inject(0) do |sum, re|
      sum + re.finish_points
    end
  end
end
