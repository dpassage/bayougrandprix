require 'test_helper'

class RacesControllerTest < ActionController::TestCase
  fixtures :all
  
  setup do
    @race = races(:race_test_monaco)
    @season = seasons(:season_test)
  end

  test "should get index" do
    get :index, :season_id => @season.to_param
    assert_response :success
    assert_not_nil assigns(:races)
  end

  test "should get new" do
    get :new, :season_id => @season.to_param
    assert_response :success
  end

  test "should create race" do
    assert_difference('Race.count') do
      post :create, :season_id => @season.to_param, :race => @race.attributes
    end

    assert_redirected_to season_race_path(assigns(:season), assigns(:race))
  end

  test "should show race" do
    get :show, :season_id => @season.to_param, :id => @race.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :season_id => @season.to_param, :id => @race.to_param
    assert_response :success
  end

  test "should update race" do
    put :update, :season_id => @season.to_param, :id => @race.to_param, :race => @race.attributes
    assert_redirected_to season_race_path(assigns(:season), assigns(:race))
  end

  test "should remove race" do
    assert_difference('Race.count', -1) do
      delete :destroy, :season_id => @season.to_param, :id => @race.to_param
    end

    assert_redirected_to season_races_path(assigns(:season))
  end
  
  test "cant remove a race from the wrong season" do
    assert_difference('Race.count', 0) do
      delete :destroy, :season_id => @season.to_param, :id => races(:races_001).to_param
    end
    assert_redirected_to season_races_path(assigns(:season))
  end
  
  test "cant remove a race with entrants" do
    assert_difference('Race.count', 0) do
      delete :destroy, :season_id => @season.to_param, :id => races(:race_test_daytona).to_param
    end
    assert_redirected_to season_races_path(assigns(:season))
  end
end
