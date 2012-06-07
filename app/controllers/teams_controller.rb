class TeamsController < ApplicationController
  before_filter :authorize, :only => [:update, :destroy]
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
  def destroy
    @team = Team.find(params[:id])
    name = @team.name
    begin
      @team.destroy
      flash[:notice] = "Team #{name} deleted"
    rescue ActiveRecord::DeleteRestrictionError
      flash[:error] = "Team #{name} in use, not deleted"
    end
    redirect_to(teams_path)
  end
end