class TeamsController < ApplicationController
  before_filter :authorize, :only => [:update]
  def index
    @teams = Team.all
  end
  def show
    @team = Team.find(params[:id])
  end
  def edit
    @team = Team.find(params[:id])
  end
  def update
    @team = Team.find(params[:id])
    @team.update_attributes!(params[:team])
    redirect_to(team_path(@team))
  end
end