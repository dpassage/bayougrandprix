require 'test_helper'

class AdminPageTestTest < ActionDispatch::IntegrationTest
  fixtures :all

  # Replace this with your real tests.
  test "load admin page" do
    get "/admin"
    assert_response :success
    
    # make sure there's a link to edit seasons
    assert_select "a[href=/seasons]"
    # and to edit players
    assert_select "a[href=/players]"
  end
end
