class TeamsController < ApplicationController
  before_filter :authorize, only: [:update, :destroy, :create]

  def index
    @teams = Team.order(:name)
  end

  def show
    @team = Team.find(params[:id])
  end

  def edit
    @team = Team.find(params[:id])
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(safe_params)
    if @team.save
      flash[:notice] = "Team #{@team.name} created"
      redirect_to(teams_path)
    else
      flash[:error] = 'Team could not be created'
      render action: 'new'
    end
  end

  def update
    @team = Team.find(params[:id])
    @team.update_attributes!(safe_params)
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

  private

  def safe_params
    params[:team].permit(:name, :color, :fake)
  end
end
