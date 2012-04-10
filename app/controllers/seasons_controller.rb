class SeasonsController < ApplicationController
  before_filter :authorize, :only => [:create, :update, :destroy, :add_driver]
  # GET /seasons
  def index
    @seasons = Season.order(:name)
  end

  # GET /seasons/1
  def show
    seasons = Season.where(:name=>params[:id])
    @season = seasons.first
    @season_entries = @season.season_entries
    @races = @season.races
    if admin?
      @drivers = Driver.order(:name)
      @tracks = Track.all
    end
  end

  # GET /seasons/2002/results
  def results
    @season = Season.where(:name=>params[:id]).first
    @drivers_by_points = @season.drivers_by_points
    @drivers_by_qualifying_points = @season.drivers_by_qualifying_points
    @teams_by_points = @season.teams_by_points
  
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @season }
    end
  end

  # POST /seasons/1/add_driver
  def add_driver
    season = Season.find(params[:season_id])
    driver = Driver.find(params[:season_entry][:driver_id])
    team = Team.find(params[:season_entry][:defaultteam_id])
    if season.add_driver(driver, team)
      flash[:notice] = "Driver #{driver.name} entered"
    else
      flash[:error] = "Driver #{driver.name} already entered!"
    end
    redirect_to season_path(season)
  end
  # GET /seasons/new
  # GET /seasons/new.xml
  def new
    @season = Season.new
  end

  # # GET /seasons/1/edit
  # def edit
  #   @season = Season.find_by_name(params[:id])
  # end

  # POST /seasons
  # POST /seasons.xml
  def create
    scoring_scheme = ScoringScheme.find(params[:season][:scoring_scheme])
    @season = Season.new(:name => params[:season][:name],
                         :scoring_scheme => scoring_scheme)

    if @season.save
      redirect_to seasons_path
    else
      render :action => "new"
    end
  end
end
