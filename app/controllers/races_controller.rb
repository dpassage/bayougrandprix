class RacesController < ApplicationController
  before_filter :authorize, :only => [:create, :update, :destroy]
  def create
    season = Season.find_by_name(params[:season_id])
    @race = Race.new(params[:race])
    @race.season = season
    begin
      @race.save!
      flash[:notice] = "Race added"
    rescue ActiveRecord::RecordInvalid
      flash[:error] = "Race not valid"
    end
    redirect_to season_path(@race.season)
  end
  def show
    @race = Race.find(params[:id])
    @season = Season.find_by_name(params[:season_id])
  end
  def edit
    @race = Race.find(params[:id])
    @season = Season.find_by_name(params[:season_id])
  end
  def update
    season = Season.find_by_name(params[:season_id])
    race = Race.find(params[:id])
    begin
      race.update_attributes!(params[:race])
      flash[:notice] = "Race results updated"
    rescue ActiveRecord::RecordNotUnique
      flash[:error] = "Finishing and qualifying places must be unique"
    end
    redirect_to season_race_path(season, race)
  end
end
