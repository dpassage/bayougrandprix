class RacesController < ApplicationController
  # GET /races
  # GET /races.xml
  def index
    @season = Season.where(:name => params[:season_id]).first
    @races = @season.races.order("date")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @races }
    end
  end

  # GET /races/1
  # GET /races/1.xml
  def show
    @season = Season.where(:name => params[:season_id]).first
    @race = Race.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @race }
    end
  end

  # GET /races/new
  # GET /races/new.xml
  def new
    @season = Season.where(:name => params[:season_id]).first
    @race = Race.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @race }
    end
  end

  # GET /races/1/edit
  def edit
    @season = Season.where(:name => params[:season_id]).first
    @race = Race.find(params[:id])
  end

  # POST /races
  # POST /races.xml
  def create
    @season = Season.where(:name => params[:season_id]).first
    @race = Race.new(params[:race])

    respond_to do |format|
      if @race.save
        format.html { redirect_to season_race_path(@season, @race), :notice => 'Race was successfully created.' }
        format.xml  { render :xml => @race, :status => :created, :location => @race }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @race.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /races/1
  # PUT /races/1.xml
  def update
    @season = Season.where(:name => params[:season_id]).first
    @race = Race.find(params[:id])

    respond_to do |format|
      if @race.update_attributes(params[:race])
        format.html { redirect_to(season_race_path(@season, @race), :notice => 'Race was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @race.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /races/1
  # DELETE /races/1.xml
  def destroy
    @season = Season.where(:name => params[:season_id]).first
    @race = Race.find(params[:id])

    if @race.season != @season
      notice = "Error: race with id #{@race.id} not part of season #{@season.name}"
    elsif @race.race_entries.count != 0
      notice = "Error: race with id #{@race.id} has entrants"
    else
      @race.destroy
      notice = 'Race was removed'
    end
    
    respond_to do |format|
      format.html { redirect_to(season_races_url(@season), :notice => notice) }
      format.xml  { head :ok }
    end
  end
end
