class SeasonEntriesController < ApplicationController
  def destroy
    se = SeasonEntry.find(params[:id])
    se.destroy
    redirect_to season_path(params[:season_id])
  end
end
