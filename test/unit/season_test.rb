require 'test_helper'

class SeasonTest < ActiveSupport::TestCase
  fixtures :all
  test "to_param is name" do
    season = seasons(:seasons_001)
    assert_equal season.to_param, season.name
  end
  test "entries_by_points is array of season_entries sorted by points scored" do
    season = seasons(:seasons_001)
    results = season.entries_by_points
    assert_equal 12, results.length
    assert_equal drivers(:schumacher), results[0].driver
  end
end
