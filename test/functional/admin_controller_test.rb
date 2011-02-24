require 'test_helper'
require 'ruby_debug'

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
    # and to edit teams
    assert_select "a[href=/teams]"

    #list should contain seasons in order
    assert_select "tr:nth-of-type(2) td", "2001"
    assert_select "tr:nth-of-type(3) td", "2002"
    assert_select "tr:nth-of-type(4) td", "2003"
    assert_select "tr:nth-of-type(5) td", "2004"
  end
end
