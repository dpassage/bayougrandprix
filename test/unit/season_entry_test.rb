require 'test_helper'

class SeasonEntryTest < ActiveSupport::TestCase
  fixtures :all
  test "season entry must have a season" do
    se = season_entries(:season_entries_036)
    se.season = nil
    assert !se.save
  end
  test "season entry must have a season, team, and driver" do
    se = SeasonEntry.new
    se.season = nil
    se.defaultteam = nil
    se.driver = nil
    assert !se.save
    se.season = seasons(:season_2002)
    assert !se.save
    se.defaultteam = teams(:mclaren)
    assert !se.save
    se.driver = drivers(:mika)
    assert se.save
  end
end
