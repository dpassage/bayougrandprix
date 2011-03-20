class Season < ActiveRecord::Base
  has_many :season_entries
  has_many :races
  belongs_to :scoring_scheme
  def to_param
    name
  end
  def entries_by_points
    self.season_entries.sort_by { |e| -(e.total_points) }
                                # reversing order of e1, e2 forces descending order
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
