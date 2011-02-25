require 'test_helper'

class SeasonTest < ActiveSupport::TestCase
  fixtures :seasons
  test "to_param is name" do
    season = seasons(:one)
    assert_equal season.to_param, season.name
  end
end
