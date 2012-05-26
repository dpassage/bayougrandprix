class ScoringScheme < ActiveRecord::Base
  has_many :seasons, :dependent => :restrict
  attr_accessible :name

  def points_for_finishing(place)
    points_by_place = self.name.split('-')
    points = points_by_place[place - 1]
    (points == nil ? 0 : points.to_i)
  end
end
