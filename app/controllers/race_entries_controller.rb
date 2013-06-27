class RaceEntriesController < ApplicationController
  before_filter :authorize, only: [:create, :update, :destroy]

  def create
    @re = RaceEntry.new(safe_params)
    @re.save!
    flash[:notice] = "Driver #{@re.driver_entry.driver.name} now entered!"
    redirect_to edit_season_race_path(@re.race.season, @re.race)
  end

  private

  def safe_params
    params[:race_entry].permit(:driver_entry_id, :race_id, :team_id)
  end
end
