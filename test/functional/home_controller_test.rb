require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "load main page" do
    get :index
    assert_response :success

    #list should contain seasons in order
    assert_select "tr:nth-of-type(2) td", "2001"
    assert_select "tr:nth-of-type(3) td", "2002"
    assert_select "tr:nth-of-type(4) td", "2003"
    assert_select "tr:nth-of-type(5) td", "2004"
  end

end
