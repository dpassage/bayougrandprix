require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  fixtures :all
  
  # Replace this with your real tests.
  test "load admin page" do
    get :index
    assert_response :success
    
    # make sure there's a link to edit seasons
    assert_select "a[href=/seasons]"
    # and to edit players
    assert_select "a[href=/players]"
    # and to edit drivers
    assert_select "a[href=/drivers]"
  end
end
