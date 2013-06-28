class DriverEntry < ActiveRecord::Base
  belongs_to :driver
  belongs_to :season
  belongs_to :defaultteam, class_name: 'Team',
                           foreign_key: 'defaultteam_id'
  has_many :race_entries, dependent: :restrict_with_exception
  validates_presence_of :defaultteam
  validates_presence_of :driver
  validates_presence_of :season

  def finish_points
    self.race_entries.reduce(0) do |sum, re|
      sum + re.finish_points
    end
  end

  def finishes_in_place(n)
    self.race_entries.reduce(0) do |total, re|
      total + (re.finish == n ? 1 : 0)
    end
  end
end
