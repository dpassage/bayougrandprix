class Season < ActiveRecord::Base
  has_many :season_entries
  has_many :races
  belongs_to :scoring_scheme
  def to_param
    name
  end

  class DriverEntry
    attr_accessor :driver
    attr_accessor :defaultteam
    attr_accessor :points
  end
  
  def drivers_by_points
    driver_hash = {}
    self.races.each do |r|
      r.race_entries.each do |re|
        cur = driver_hash[re.driver]
        if cur == nil
          driver_hash[re.driver] = re.finish_points
        else
          driver_hash[re.driver] = cur + re.finish_points
        end
      end
    end
    
    results = []
    driver_hash.keys.each do |d|
      de = DriverEntry.new
      de.driver = d
      de.defaultteam = self.season_entries.where(:driver_id => d.id).first.defaultteam
      de.points = driver_hash[d]
      results.push(de)
    end
    
    results.sort_by { |de| -(de.points) }
  end
  
  class TeamEntry
    attr_accessor :team
    attr_accessor :points
  end
  def teams_by_points
    team_hash = {}
    self.races.each do |r|
      r.race_entries.each do |re|
        cur = team_hash[re.team]
        if cur == nil
          team_hash[re.team] = re.finish_points
        else
          team_hash[re.team] = cur + re.finish_points
        end
      end
    end
    
    results = []
    team_hash.keys.each do |t|
      te = TeamEntry.new
      te.team = t
      te.points = team_hash[t]
      results.push(te)
    end
    
    results.sort_by { |te| -(te.points) } # negating forces descending sort
  end
end
