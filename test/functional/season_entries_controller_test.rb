require 'test_helper'

class SeasonEntriesControllerTest < ActionController::TestCase
  setup do
    @season_entry = season_entries(:season_entries_080)
    @season = seasons(:season_test)
  end

  test "should get index with season" do
    get :index, :season_id => @season.to_param
    assert_response :success
    assert_not_nil assigns(:season_entries)
  end

  test "should get new with season" do
    get :new, :season_id => @season.to_param
    assert_response :success
  end

  test "admin should create season_entry" do
    user_is_admin
    assert_difference('SeasonEntry.count') do
      post :create, :season_id => @season.to_param, 
        :season_entry => @season_entry.attributes
    end

    assert_redirected_to season_path(assigns(:season))
  end
  
  test "guest should not create season_entry" do
    user_is_guest
    assert_difference('SeasonEntry.count', 0) do
      post :create, 
           :season_entry => @season_entry.attributes,
           :season_id => @season.to_param
    end

    assert_redirected_to root_path
    assert_not_nil flash[:error]
  end
  
  test "should show season_entry" do
    get :show, :id => @season_entry.to_param, :season_id => @season.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @season_entry.to_param, :season_id => @season.to_param
    assert_response :success
  end

  test "admin should update season_entry" do
    user_is_admin
    put :update, 
        :id => @season_entry.to_param, 
        :season_id => @season.to_param,
        :season_entry => @season_entry.attributes
    assert_redirected_to season_path(assigns(:season))
  end
  
  test "guest should not update season_entry" do
    user_is_guest
    put :update, :id => @season_entry.to_param, 
        :season_entry => @season_entry.attributes,
        :season_id => @season.to_param
    assert_redirected_to root_path
    assert_not_nil flash[:error]
  end

  test "admin should destroy season_entry" do
    user_is_admin
    assert_difference('SeasonEntry.count', -1) do
      delete :destroy, 
             :id => @season_entry.to_param, 
             :season_id => @season.to_param
    end

    assert_redirected_to season_path(assigns(:season))
  end
  
  test "guest should not destroy season_entry" do
    user_is_guest
    assert_difference('SeasonEntry.count', 0) do
      delete :destroy, :id => @season_entry.to_param, :season_id => @season.to_param
    end

    assert_redirected_to root_path
    assert_not_nil flash[:error]
  end
end
