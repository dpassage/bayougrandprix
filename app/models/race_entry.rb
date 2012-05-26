class RaceEntry < ActiveRecord::Base
  belongs_to :race
  belongs_to :season_entry
  belongs_to :team
  validates_presence_of :race
  validates_presence_of :season_entry
  validates_presence_of :team
  attr_accessible :race, :season_entry, :team
  
  def driver
    season_entry.driver
  end
  
  def finish_points
    if self.dnf
      0
    else
      self.race.points_for_finishing(self.finish)
    end
  end
  def qualifying_points
    if self.dnq != false
      0
    else
      self.race.points_for_finishing(self.qualify)
    end
  end
end
