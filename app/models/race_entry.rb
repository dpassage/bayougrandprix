class RaceEntry < ActiveRecord::Base
  belongs_to :race
  belongs_to :driver
  belongs_to :team
  
  def finish_points
    if self.dnf
      0
    else
      self.race.season.scoring_scheme.points_for_finishing(self.finish)
    end
  end
end
