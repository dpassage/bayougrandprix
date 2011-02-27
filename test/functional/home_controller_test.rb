require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "load main page" do
    get :index
    assert_response :success

    #list should contain seasons in order, each which is a link to a results page
    assert_select "tr:nth-of-type(2) td a[href=/seasons/2001/results]"
    assert_select "tr:nth-of-type(3) td a[href=/seasons/2002/results]"
    assert_select "tr:nth-of-type(4) td a[href=/seasons/2003/results]"
    assert_select "tr:nth-of-type(5) td a[href=/seasons/2004/results]"
  end

end
