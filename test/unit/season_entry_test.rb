require 'test_helper'

class SeasonEntryTest < ActiveSupport::TestCase
  fixtures :all
  # Replace this with your real tests.
  test "the truth" do
    entry = season_entries(:season_entries_015)
    assert_not_nil entry
    assert_not_nil entry.driver.name
    assert_not_nil entry.season.name
    assert_not_nil entry.defaultteam.name
  end
end
