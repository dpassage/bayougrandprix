require 'test_helper'

class RaceTest < ActiveSupport::TestCase
  fixtures :all
  # Replace this with your real tests.
  test "should not save race without season, track, or date" do
    race = Race.new
    assert !race.save
    race.season = seasons(:season_test)
    assert !race.save
    race.track = tracks(:daytona)
    assert !race.save
    race.date = Date.today
    assert race.save
  end

end
