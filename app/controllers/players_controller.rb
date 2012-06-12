class PlayersController < ApplicationController
  before_filter :authorize, :only => [:create, :update, :destroy]
  # GET /players
  # GET /players.xml
  def index
    @players = Player.all
  end
  def new
    @player = Player.new
  end
  def create
    @player = Player.new(params[:player])
    if @player.save
      flash[:notice] = "Player #{@player.name} created"
      redirect_to(players_path)
    else
      flash[:error] = "Player could not be created"
      render action: "new"
    end
  end
end
