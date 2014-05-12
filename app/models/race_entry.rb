class RaceEntry < ActiveRecord::Base
  belongs_to :race
  belongs_to :driver_entry
  belongs_to :team
  validates_presence_of :race
  validates_presence_of :driver_entry
  validates_presence_of :team
  validates :finish, uniqueness: { scope: :race_id }, allow_nil: true

  def driver
    driver_entry.driver
  end

  def finish_points
    if dnf
      0
    else
      race.points_for_finishing(finish)
    end
  end

  def qualifying_points
    if dnq
      0
    else
      race.points_for_finishing(qualify)
    end
  end
end
