require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "should not save player without name" do
    player = Player.new
    assert !player.save
  end
  
  test "should save player with name but without email" do
    player = Player.new
    player.name = "Bob"
    assert player.save
  end
end
