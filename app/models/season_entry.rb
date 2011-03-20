class SeasonEntry < ActiveRecord::Base
  belongs_to :driver
  belongs_to :season
  belongs_to :defaultteam, :class_name => "Team", :foreign_key => "defaultteam"
  
  def total_points
    points = 0
    self.season.races.each do |race|
      RaceEntry.where(:race_id => race, :driver_id => self.driver).each do |re|
        if !re.dnf
          new_points = season.scoring_scheme.points_for_finishing(re.finish)
        else
          new_points = 0
        end
        points = points + new_points
      end
    end
    points
  end
end
