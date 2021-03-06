class SeasonsController < ApplicationController
  before_filter :authorize, only: [:create, :update, :destroy]
  # GET /seasons
  def index
    @seasons = Season.order(:name)
  end

  # GET /seasons/1
  def show
    @season = Season.find_by_name(params[:id])
    @driver_entries = @season.driver_entries
    @races = @season.races
    return unless admin?
    @drivers = Driver.order(:name)
    @tracks = Track.all
  end

  # GET /seasons/2002/results
  def results
    @season = Season.find_by_name(params[:id])
    @drivers_by_points = @season.drivers_by_points
    @drivers_by_qualifying_points = @season.drivers_by_qualifying_points
    @teams_by_points = @season.teams_by_points
  end

  # GET /seasons/new
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
    @season = Season.new(safe_params)

    if @season.save
      redirect_to seasons_path
    else
      render action: 'new'
    end
  end

  private

  def safe_params
    params[:season].permit(:name, :scoring_scheme_id)
  end
end
