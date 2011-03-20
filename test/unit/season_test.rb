require 'test_helper'

class SeasonTest < ActiveSupport::TestCase
  fixtures :all
  test "to_param is name" do
    season = seasons(:season_2002)
    assert_equal season.to_param, season.name
  end
  test "drivers_by_points is array of driver entries sorted by points scored" do
    season = seasons(:season_2002)
    results = season.drivers_by_points
    assert_equal 12, results.length
    assert_equal drivers(:schumacher), results[0].driver
    assert_equal 47, results[0].points
  end
  test "2002 season uses 10-6-4-3-2-1 scheme" do
    season = Season.where(:name =>"2002").first
    assert_equal "10-6-4-3-2-1", season.scoring_scheme.name
  end
  test "teams_by_points is an array of team entries sorted by points scored" do
    season = seasons(:season_2002)
    results = season.teams_by_points
    assert_equal 5, results.length
    assert_equal teams(:mclaren), results[0].team
    assert_equal 85, results[0].points
  end
end
