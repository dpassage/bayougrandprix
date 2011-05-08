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
  def qualifying_points
    if self.dnq != false
      0
    else
      self.race.season.scoring_scheme.points_for_finishing(self.qualify)
    end
  end
end
