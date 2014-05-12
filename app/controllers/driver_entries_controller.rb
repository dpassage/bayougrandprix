class DriverEntriesController < ApplicationController
  before_filter :authorize, only: [:create, :update, :destroy]
  def destroy
    de = DriverEntry.find(params[:id])
    begin
      de.destroy
      flash[:notice] = "Driver #{de.driver.name} removed from season " \
                       "#{de.season.name}"
    rescue ActiveRecord::DeleteRestrictionError
      flash[:error] = "Cannot delete season entry; driver #{de.driver.name} " \
                      'is entered in a race'
    end
    redirect_to season_path(de.season)
  end

  def create
    season = Season.where(name: params[:season_id]).first
    @de = DriverEntry.new(safe_params.merge(season: season))
    begin
      @de.save!
    rescue ActiveRecord::RecordNotUnique
      flash[:error] =
        "#{@de.driver.name} already entred in #{@de.season.name} season"
    end
    unless flash[:error]
      flash[:notice] = "#{@de.driver.name} added to #{@de.season.name} season"
    end
    redirect_to season_path(season)
  end

  private

  def safe_params
    params.require(:driver_entry).permit(:driver_id, :defaultteam_id)
  end
end
