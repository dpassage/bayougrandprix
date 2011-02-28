require 'test_helper'

class SeasonTest < ActiveSupport::TestCase
  fixtures :seasons
  test "to_param is name" do
    season = seasons(:seasons_001)
    assert_equal season.to_param, season.name
  end
end
