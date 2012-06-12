class RaceEntriesController < ApplicationController
  before_filter :authorize, :only => [:create, :update, :destroy]
  
  def create
    @re = RaceEntry.new(params[:race_entry])
    @re.save!
    flash[:notice] = "Driver #{@re.season_entry.driver.name} now entered!"
    redirect_to season_race_path(@re.race.season, @re.race)
  end
end
