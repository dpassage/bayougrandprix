require 'test_helper'

class SeasonEntryTest < ActiveSupport::TestCase
  fixtures :all
  # Replace this with your real tests.
  test "compute points" do
    entry = season_entries(:season_entries_002) # david coulthard 2002 season
    assert_equal entry.total_points, 42
  end
end
