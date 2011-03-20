require 'test_helper'

class RaceEntryTest < ActiveSupport::TestCase
  fixtures :all
  # Replace this with your real tests.
  test "race entry knows how many points it's worth" do
    race = races(:races_009) # hockenheim, 2002 season
    re = race.race_entries.where(:driver_id => drivers(:mika)).first
    assert_equal re.finish_points, 4
    re = race.race_entries.where(:driver_id => drivers(:foyt)).first
    assert_equal re.finish_points, 0
  end
  test "race entry knows how many qualifying points it's worth" do
    race = races(:races_009) # hockenheim, 2002 season
    re = race.race_entries.where(:driver_id => drivers(:foyt)).first
    assert_equal re.qualifying_points, 4
    re = race.race_entries.where(:driver_id => drivers(:mika)).first
    assert_equal re.qualifying_points, 0
  end
  
end
