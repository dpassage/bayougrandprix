class Season < ActiveRecord::Base
  has_many :season_entries, :dependent => :restrict_with_exception
  has_many :races, :dependent => :restrict_with_exception
  belongs_to :scoring_scheme
  validates_presence_of :name
  validates_presence_of :scoring_scheme_id
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
    include Comparable

    attr_accessor :entrant
    attr_accessor :points
    attr_accessor :finishes
    attr_accessor :entry

    def finishes
      @finishes ||= []
    end

    def points
      @points ||= self.entry.finish_points
    end

    def entrant
      if @entrant
        @entrant
      else
        @entry.driver
      end
    end

    def <=>(other_te)
      if self.points == other_te.points
        (1..10).each do |i|
          if self.finishes[i].nil?
            self.finishes[i] = self.entry.finishes_in_place(i)
          end
          if other_te.finishes[i].nil?
            other_te.finishes[i] = other_te.entry.finishes_in_place(i)
          end
          return -(self.finishes[i] <=> other_te.finishes[i]) unless self.finishes[i] == other_te.finishes[i]
        end
        return 0
      else
        -(self.points <=> other_te.points)
      end
    end

    def points_description
      result = points.to_s
      if finishes
        (1..10).each do |i|
          if finishes[i] && finishes[i] > 0
            result = result + ", #{finishes[i]} #{ordinal(i)}#{finishes[i] == 1 ? "" : "s"}"
          end
        end
      end
      result
    end

    def ordinal(pos)
      if pos == 1
        "win"
      elsif pos == 2
        "2nd"
      elsif pos == 3
        "3rd"
      else
        "#{pos}th"
      end
    end
  end

  def driver_results_table_by_finish_points
    table = self.driver_entries.collect { |de| 
      te = TableEntry.new
      te.entry = de 
      te
    }
    table.sort
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
    self.driver_results_table_by_finish_points
  end
  def drivers_by_qualifying_points
    self.results_table_by_points(:driver, :qualifying_points)
  end
  
  def points_for_finishing(place)
    self.scoring_scheme.points_for_finishing(place)
  end

end
