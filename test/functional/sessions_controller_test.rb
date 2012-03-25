require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  
  test "wrong password is login failure" do
    post :create, :password => "wrong"
    assert_response :success
    assert_not_equal "admin", session[:role]
  end
  
  test "should get destroy" do
    @request.session[:role] = "admin"
    get :destroy
    assert_redirected_to root_path
    assert_not_equal "admin", session[:role]
  end

end
