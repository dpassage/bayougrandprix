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

  # test "admin should create player" do
  #   user_is_admin
  #   assert_difference('Player.count') do
  #     post :create, :player => @player.attributes
  #   end
  # 
  #   assert_redirected_to player_path(assigns(:player))
  # end
  
  
  test "should show player" do
    get :show, :id => @player.to_param
    assert_response :success
  end

  # test "admin should update player" do
  #   user_is_admin
  #   put :update, :id => @player.to_param, :player => @player.attributes
  #   assert_redirected_to player_path(assigns(:player))
  # end

    
end
