class RacesController < ApplicationController
  def create
    season = Season.find_by_name(params[:season_id])
    @race = Race.new(params[:race])
    @race.season = season
    @race.save!
    flash[:notice] = "Race added"
    redirect_to season_path(@race.season)
  end
end
