class Season < ActiveRecord::Base
  has_many :season_entries
  has_many :races
  def to_param
    name
  end
end
