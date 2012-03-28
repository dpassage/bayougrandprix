require 'test_helper'

class PlayersControllerTest < ActionController::TestCase
  setup do
    @player = players(:tim)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:players)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  # test "admin should create player" do
  #   user_is_admin
  #   assert_difference('Player.count') do
  #     post :create, :player => @player.attributes
  #   end
  # 
  #   assert_redirected_to player_path(assigns(:player))
  # end
  
  test "guest should not create player" do
    user_is_guest
    assert_difference('Player.count', 0) do
      post :create, :player => @player.attributes
    end
    
    assert_redirected_to root_path
    assert_not_nil flash[:error]
  end
  
  test "should show player" do
    get :show, :id => @player.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @player.to_param
    assert_response :success
  end

  # test "admin should update player" do
  #   user_is_admin
  #   put :update, :id => @player.to_param, :player => @player.attributes
  #   assert_redirected_to player_path(assigns(:player))
  # end

  test "guest should not update player" do
    user_is_guest
    put :update, :id => @player.to_param, :player => @player.attributes
    assert_redirected_to root_path
    assert_not_nil flash[:error]
  end

  test "admin should destroy player" do
    user_is_admin
    assert_difference('Player.count', -1) do
      delete :destroy, :id => @player.to_param
    end
    assert_redirected_to players_path
  end
  
  test "guest should not destroy player" do
    user_is_guest
    assert_difference('Player.count', 0) do
      delete :destroy, :id => @player.to_param
    end
    assert_redirected_to root_path
    assert_not_nil flash[:error]
  end
    
end
