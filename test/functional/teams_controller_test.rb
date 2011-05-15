require 'test_helper'

class TeamsControllerTest < ActionController::TestCase
  setup do
    @team = teams(:teams_002)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teams)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "admin should create team" do
    user_is_admin
    assert_difference('Team.count') do
      post :create, :team => @team.attributes
    end

    assert_redirected_to team_path(assigns(:team))
  end
  test "guest should not create team" do
    user_is_guest
    assert_difference('Team.count', 0) do
      post :create, :team => @team.attributes
    end

    assert_redirected_to root_path
    assert_not_nil flash[:error]
  end

  test "should show team" do
    get :show, :id => @team.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @team.to_param
    assert_response :success

    #text field for name
    assert_select "input#team_name[type=text]"
    #multi-select for color
    assert_select "select#team_color"
    #multi-select for fake/real
    assert_select "select#team_fake"
  end

  test "admin should update team" do
    user_is_admin
    put :update, :id => @team.to_param, :team => @team.attributes
    assert_redirected_to team_path(assigns(:team))
  end
  
  test "guest should not update team" do
    user_is_guest
    put :update, :id => @team.to_param, :team => @team.attributes
    assert_redirected_to root_path
    assert_not_nil flash[:error]
  end

  test "admin should destroy team" do
    user_is_admin
    assert_difference('Team.count', -1) do
      delete :destroy, :id => @team.to_param
    end

    assert_redirected_to teams_path
  end

  test "guest should not destroy team" do
    user_is_guest
    assert_difference('Team.count', 0) do
      delete :destroy, :id => @team.to_param
    end

    assert_redirected_to root_path
    assert_not_nil flash[:error]
  end
end
