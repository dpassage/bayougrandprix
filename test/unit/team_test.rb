require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "name and color must be present" do
    team = Team.new
    assert !team.save
    team.name = "foo"
    assert !team.save
    team.color = "#FFFFFF"
    assert team.save
  end
  test "there is a hash for colors" do
    assert_equal Team::Colors["White"], "#FFFFFF"
  end
  test "fake must be true or false" do
    team = Team.new
    team.name = "foo"
    team.color = "#FFFFFF"
    team.fake = nil
    assert !team.save
    team.fake = true
    assert team.save
    team.fake = false
    assert team.save
  end
  test "color must be a legal color" do
    team = Team.new
    team.name = "bar"
    team.color = "this is not a color"
    assert !team.save
    team.color = Team::Colors.values[1]
    assert team.save
  end
end
