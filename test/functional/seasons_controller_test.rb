require 'test_helper'

class SeasonsControllerTest < ActionController::TestCase
  setup do
    @season = seasons(:seasons_001)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:seasons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create season" do
    assert_difference('Season.count') do
      post :create, :season => @season.attributes
    end

    assert_redirected_to season_path(assigns(:season))
  end

  test "should show season by name" do
    get :show, :id => @season.name
    assert_response :success
  end
  
  test "should show results" do
    get :results, :id => @season.to_param
    assert_response :success
    
    assert_select "h1", /2002/
    assert_select "table:nth-of-type(1)" do
      assert_select "th", "Driver"
      assert_select "th", "Player"
      assert_select "th", "Team"
      assert_select "tr:nth-of-type(2)[bgcolor=#{Team::Colors["Yellow"]}]"
      assert_select "tr:nth-of-type(2) td:nth-of-type(3)", "Axle of Evil"
    end
    
    assert_select "table:nth-of-type(2)" do
      assert_select "tr:nth-of-type(1)" do
        assert_select "th", "Date"
        assert_select "th", "Track"
        assert_select "th", "Country"
        assert_select "th", "Winner"
      end
     # assert_select "tr:nth-of-type(2)" do
      #  assert_select "td:nth-of-type(1)", "2002-02-12"
      #end
    end
  end

  test "should get edit" do
    get :edit, :id => @season.to_param
    assert_response :success
  end

  test "should update season" do
    put :update, :id => @season.to_param, :season => @season.attributes
    assert_redirected_to season_path(assigns(:season))
  end

  test "should destroy season" do
    assert_difference('Season.count', -1) do
      delete :destroy, :id => @season.to_param
    end

    assert_redirected_to seasons_path
  end
end
