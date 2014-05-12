class ScoringScheme < ActiveRecord::Base
  has_many :seasons, dependent: :restrict_with_exception
  validates :name, presence: true, format:
      { with: /\A[0-9]+(-[0-9]+)+\z/,
        message: "must be of the form '5-4-3-2-1'" }

  def points_for_finishing(place)
    return 0 if place.nil?
    points_by_place = name.split('-')
    points = points_by_place[place - 1]
    (points.nil? ? 0 : points.to_i)
  end
end
