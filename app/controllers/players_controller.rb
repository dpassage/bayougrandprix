class PlayersController < ApplicationController
  before_filter :authorize, :only => [:create, :update, :destroy]
  # GET /players
  # GET /players.xml
  def index
    @players = Player.all
  end
end
