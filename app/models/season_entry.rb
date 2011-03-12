class SeasonEntry < ActiveRecord::Base
  belongs_to :driver
  belongs_to :season
  belongs_to :defaultteam, :class_name => "Team", :foreign_key => "defaultteam"
  
  def total_points
    points = 0
    self.season.races.each do |race|
      RaceEntry.where(:race_id => race, :driver_id => self.driver).each do |re|
        if !re.dnf
          new_points = case re.finish
            when 1: 10
            when 2: 6
            when 3: 4
            when 4: 3
            when 5: 2
            when 6: 1
            else 0
          end
        else
          new_points = 0
        end
        points = points + new_points
      end
    end
    points
  end
end
