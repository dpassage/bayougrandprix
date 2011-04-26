require 'test_helper'

class LoginSequenceTest < ActionDispatch::IntegrationTest
  fixtures :all

  test "user can log in" do
    get "/login"
    assert_response :success
    
    post_via_redirect "/login", :password => "foobar"
    assert_equal "/", path
    assert_equal "admin", session[:role]
    
    get_via_redirect "/logout"
    assert_equal "/", path
#    assert_equal "Logged out", flash[:notice]
    assert_not_equal "admin", session[:role]
  end
end
