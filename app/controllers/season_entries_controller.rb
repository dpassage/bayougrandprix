class SeasonEntriesController < ApplicationController
  before_filter :authorize, :only => [:create, :destroy, :update]

  # GET /season_entries
  # GET /season_entries.xml
  def index
    @season_entries = SeasonEntry.all
    @season = Season.where(:name => params[:season_id]).first

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @season_entries }
    end
  end

  # GET /season_entries/1
  # GET /season_entries/1.xml
  def show
    @season_entry = SeasonEntry.find(params[:id])
    @season = Season.where(:name => params[:season_id]).first
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @season_entry }
    end
  end

  # GET /season_entries/new
  # GET /season_entries/new.xml
  def new
    @season_entry = SeasonEntry.new
    @season = Season.where(:name => params[:season_id]).first
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @season_entry }
    end
  end

  # GET /season_entries/1/edit
  def edit
    @season_entry = SeasonEntry.find(params[:id])
    @season = Season.where(:name => params[:season_id]).first
  end

  # POST /season_entries
  # POST /season_entries.xml
  def create
    @season_entry = SeasonEntry.new(params[:season_entry])
    @season = Season.where(:name => params[:season_id]).first

    respond_to do |format|
      if @season_entry.save
        format.html { redirect_to(@season, :notice => 'Season entry was successfully created.') }
        format.xml  { render :xml => @season_entry, :status => :created, :location => @season_entry }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @season_entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /season_entries/1
  # PUT /season_entries/1.xml
  def update
    @season_entry = SeasonEntry.find(params[:id])
    @season = Season.where(:name => params[:season_id]).first

    respond_to do |format|
      if @season_entry.update_attributes(params[:season_entry])
        format.html { redirect_to(@season, :notice => 'Season entry was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @season_entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /season_entries/1
  # DELETE /season_entries/1.xml
  def destroy
    @season_entry = SeasonEntry.find(params[:id])
    @season = Season.where(:name => params[:season_id]).first
    @season_entry.destroy

    respond_to do |format|
      format.html { redirect_to(@season, :notice => 'Season entry was successfully deleted') }
      format.xml  { head :ok }
    end
  end
end
