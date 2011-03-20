require 'test_helper'

class ScoringSchemeTest < ActiveSupport::TestCase
  fixtures :all
  # Replace this with your real tests.
  test "there is a scheme for 10-6-4-3-2-1" do
    assert_not_nil ScoringScheme.where(:name => "10-6-4-3-2-1").first
  end
  
  test "scheme named 9-6-4-3-2-1 awards correct points" do
    scheme = ScoringScheme.where(:name => "9-6-4-3-2-1").first
    assert_not_nil scheme
    assert_equal 9, scheme.points_for_finishing(1)
    assert_equal 6, scheme.points_for_finishing(2)
    assert_equal 4, scheme.points_for_finishing(3)
    assert_equal 3, scheme.points_for_finishing(4)
    assert_equal 2, scheme.points_for_finishing(5)
    assert_equal 1, scheme.points_for_finishing(6)
    assert_equal 0, scheme.points_for_finishing(7)
  end
end
