class Season < ActiveRecord::Base
  has_many :season_entries
  has_many :races
  def to_param
    name
  end
  def entries_by_points
    self.season_entries.sort { |e1, e2| e2.total_points <=> e1.total_points }
                                # reversing order of e1, e2 forces descending order
  end
end
