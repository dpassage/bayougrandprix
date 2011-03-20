class Season < ActiveRecord::Base
  has_many :season_entries
  has_many :races
  belongs_to :scoring_scheme

  def to_param
    self.name
  end

  class TableEntry
    attr_accessor :entrant
    attr_accessor :points
  end
  
  def results_table_by_points(entrant_type)
    entrant_hash = {}
    self.races.each do |r|
      r.race_entries.each do |re|
        entrant = re.send(entrant_type)
        cur = entrant_hash[entrant]
        if cur == nil
          entrant_hash[entrant] = re.finish_points
        else
          entrant_hash[entrant] = cur + re.finish_points
        end
      end
    end
    
    results = []
    entrant_hash.keys.each do |t|
      te = TableEntry.new
      te.entrant = t
      te.points = entrant_hash[t]
      results.push(te)
    end
    
    results.sort_by { |te| -(te.points) } # negating forces descending sort
  end
  
  def teams_by_points
    self.results_table_by_points(:team)
  end
  def drivers_by_points
    self.results_table_by_points(:driver)
  end
end
