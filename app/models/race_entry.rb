class RaceEntry < ActiveRecord::Base
  belongs_to :race
  belongs_to :driver
  belongs_to :team
  validates_presence_of :race
  validates_presence_of :driver
  attr_accessible :race, :driver
  
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
