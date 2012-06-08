class Season < ActiveRecord::Base
  has_many :season_entries, :dependent => :restrict
  has_many :races, :dependent => :restrict
  belongs_to :scoring_scheme
  validates_presence_of :name
  validates_presence_of :scoring_scheme_id
  attr_accessible :name, :scoring_scheme_id
  validate :scoring_scheme_must_exist
  
  def scoring_scheme_must_exist
    if !ScoringScheme.exists?(scoring_scheme_id)
      errors.add(:scoring_scheme_id, "must exist")
    end
  end

  def to_param
    self.name
  end

  class TableEntry
    attr_accessor :entrant
    attr_accessor :points
  end

  def results_table_by_points(entrant_type, points_type)
    entrant_hash = {}
    self.races.each do |r|
      r.race_entries.each do |re|
        entrant = re.send(entrant_type)
        cur = entrant_hash[entrant]
        newpoints = re.send(points_type)
        if cur == nil
          entrant_hash[entrant] = newpoints
        else
          entrant_hash[entrant] = cur + newpoints
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
    self.results_table_by_points(:team, :finish_points)
  end
  def drivers_by_points
    self.results_table_by_points(:driver, :finish_points)
  end
  def drivers_by_qualifying_points
    self.results_table_by_points(:driver, :qualifying_points)
  end
  
  def points_for_finishing(place)
    self.scoring_scheme.points_for_finishing(place)
  end

end
