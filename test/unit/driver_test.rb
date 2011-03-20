require 'test_helper'

class DriverTest < ActiveSupport::TestCase
  fixtures :all
  # Replace this with your real tests.
  test "driver knows its default team for a season" do
    driver = drivers(:mika)
    assert_equal teams(:mclaren), driver.default_team_for_season(seasons(:season_2002))
  end
end
