class SeasonEntriesController < ApplicationController
  def destroy
    se = SeasonEntry.find(params[:id])
    se.destroy
    redirect_to season_path(Season.where(:name=>params[:season_id]).first)
  end

  def create
    season = Season.where(:name=>params[:season_id]).first
    # driver = Driver.find(params[:season_entry][:driver_id])
    # defaultteam = Team.find(params[:season_entry][:defaultteam_id])
    @se = SeasonEntry.new(params[:season_entry])
    @se.season = season
    begin
      @se.save!
    rescue ActiveRecord::RecordNotUnique
      flash[:error] = "#{@se.driver.name} already entred in #{@se.season.name} season"
    end
    flash[:notice] = "#{@se.driver.name} added to #{@se.season.name} season" unless
      flash[:error]
    redirect_to season_path(season)
  end  
end
