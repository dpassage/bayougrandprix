class ScoringScheme < ActiveRecord::Base
  has_many :seasons, :dependent => :restrict
  validates :name, :presence => true, :format => { :with => /\A[0-9](-[0-9])+\z/,
      :message => "Name must be of the form '5-4-3-2-1'" }
  attr_accessible :name

  def points_for_finishing(place)
    if place.nil?
      return 0
    end
    points_by_place = self.name.split('-')
    points = points_by_place[place - 1]
    (points == nil ? 0 : points.to_i)
  end
end
