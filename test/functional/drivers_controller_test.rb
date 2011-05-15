require 'test_helper'

class DriversControllerTest < ActionController::TestCase
  setup do
    @driver = drivers(:mika)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:drivers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "admin should create driver" do
    user_is_admin
    assert_difference('Driver.count') do
      post :create, :driver => @driver.attributes
    end

    assert_redirected_to driver_path(assigns(:driver))
  end
  
  test "non-admin should not create driver" do
    user_is_guest
    assert_difference('Driver.count', 0) do
      post :create, :driver => @driver.attributes
    end
    assert_redirected_to root_path
    assert_not_nil flash[:error]
  end
  

  test "should show driver" do
    get :show, :id => @driver.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @driver.to_param
    assert_response :success
  end

  test "admin should update driver" do
    user_is_admin
    put :update, :id => @driver.to_param, :driver => @driver.attributes
    assert_redirected_to driver_path(assigns(:driver))
  end
  
  test "non- admin should not update driver" do
    user_is_guest
    put :update, :id => @driver.to_param, :driver => @driver.attributes
    assert_redirected_to root_path
    assert_not_nil flash[:error]
  end

  test "admin should destroy driver" do
    user_is_admin
    assert_difference('Driver.count', -1) do
      delete :destroy, :id => @driver.to_param
    end

    assert_redirected_to drivers_path
  end
  
  test "non admin should not destroy driver" do
    user_is_guest
    assert_difference('Driver.count', 0) do
      delete :destroy, :id => @driver.to_param
    end

    assert_redirected_to root_path
    assert_not_nil flash[:error]
  end
  
end
