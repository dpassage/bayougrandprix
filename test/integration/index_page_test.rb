require 'test_helper'

class IndexPageTest < ActionDispatch::IntegrationTest

  # Replace this with your real tests.
  test "load index page and go to season editing" do
    get "/"
    
    assert_response :success
    # make sure there is one row for each season, plus the title row
    assert_select "table" do
      assert_select "tr", Season.count + 1
    end
    
  end
end
