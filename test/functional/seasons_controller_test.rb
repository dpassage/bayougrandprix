require 'test_helper'

class SeasonsControllerTest < ActionController::TestCase
  setup do
    @season = seasons(:season_2002)
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
    
    # team table
    assert_select "table#team_table" do
      assert_select "th", "Driver"
      assert_select "th", "Player"
      assert_select "th", "Team"
      assert_select "tr:nth-of-type(2)[bgcolor=#{Team::Colors["Yellow"]}]"
      assert_select "tr:nth-of-type(2) td:nth-of-type(3)", "Axle of Evil"
    end
    
    # results grid
    assert_select "table#results_grid" do
      assert_select "tr:nth-of-type(1)" do
        assert_select "th", "Date"
        assert_select "th", "Track"
        assert_select "th", "Country"
        assert_select "th", "Winner"
      end
      assert_select "tr:nth-of-type(2)" do
        assert_select "td:nth-of-type(1)", "2002-02-12"
        assert_select "td:nth-of-type(4)", "Michael Schumacher"
        assert_select "td:nth-of-type(4)[bgcolor=#FF0000]"
      end
    end
    
    # driver points standings, with colors
    assert_select "table#driver_points_standings" do
      assert_select "tr:nth-of-type(2)[bgcolor=#FF0000]" do
        assert_select "td:nth-of-type(1)", "1"
        assert_select "td:nth-of-type(4)", "47"
      end
    end
    
    # team points standings
    assert_select "table#team_points_standings" do
      assert_select "tr:nth-of-type(2)[bgcolor=#0099FF]" do
        assert_select "td:nth-of-type(2)", "McLaren"
        assert_select "td:nth-of-type(3)", "85"
      end
    end
    
    # qualifying by points
    assert_select "table#qualifying_by_points" do
      assert_select "tr:nth-of-type(2)[bgcolor=#FF0000]" do
        assert_select "td:nth-of-type(2)", "Michael Schumacher"
        assert_select "td:nth-of-type(3)", "Ferrari"
        assert_select "td:nth-of-type(4)", "67"
      end
    end
  end
  
  test "2008 season should use 9-6-4-3-2-1" do
    season2008 = seasons(:seasons_005)
    get :results, :id => season2008.to_param
    assert_response :success
    assert_select "h1", /2008/
    
    assert_select "table#driver_points_standings" do
      assert_select "tr:nth-of-type(2)" do
        assert_select "td:nth-of-type(4)", "60"
      end
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
