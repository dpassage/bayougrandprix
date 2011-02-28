class Season < ActiveRecord::Base
  has_many :season_entries
  def to_param
    name
  end
end
