class SeasonsController < ApplicationController
  before_filter :authorize, :only => [:create, :update, :destroy]
  # GET /seasons
  # GET /seasons.xml
  def index
    @seasons = Season.order(:name)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @seasons }
    end
  end

  # GET /seasons/1
  # GET /seasons/1.xml
  def show
    @season = Season.where(:name=>params[:id]).first

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @season }
    end
  end

  # GET /seasons/2002/results
  def results
    @season = Season.where(:name=>params[:id]).first
    @drivers_by_points = @season.drivers_by_points
    @drivers_by_qualifying_points = @season.drivers_by_qualifying_points
    @teams_by_points = @season.teams_by_points

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @season }
    end
  end

  # GET /seasons/new
  # GET /seasons/new.xml
  def new
    @season = Season.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @season }
    end
  end

  # GET /seasons/1/edit
  def edit
    @season = Season.find_by_name(params[:id])
  end

  # POST /seasons
  # POST /seasons.xml
  def create
    scoring_scheme = ScoringScheme.find(params[:season][:scoring_scheme])
    @season = Season.new(:name => params[:season][:name],
                         :scoring_scheme => scoring_scheme)

    if @season.save
      redirect_to seasons_path
    else
      render :action => "new"
    end
  end

  # PUT /seasons/1
  # PUT /seasons/1.xml
  def update
    @season = Season.find_by_name(params[:id])

    respond_to do |format|
      if @season.update_attributes(params[:season])
        format.html { redirect_to(@season, :notice => 'Season was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @season.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /seasons/1
  # DELETE /seasons/1.xml
  def destroy
    @season = Season.find_by_name(params[:id])
    @season.destroy

    respond_to do |format|
      format.html { redirect_to(seasons_url) }
      format.xml  { head :ok }
    end
  end
end
