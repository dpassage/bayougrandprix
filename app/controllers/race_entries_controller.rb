class RaceEntriesController < ApplicationController
  before_filter :authorize, :only => [:create]
  
  def create
    se = SeasonEntry.find(params[:season_entry_id])
    race = Race.find(params[:race_id])
    team = Team.find(params[:team_id])
    @re = RaceEntry.new(season_entry: se, race: race, team: team)
    @re.save!
    flash[:notice] = "Driver #{se.driver.name} now entered!"
    redirect_to season_race_path(se.season, race)
  end
end
