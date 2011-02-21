class AdminController < ApplicationController
  def index
    @seasons = Season.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @seasons }
    end
  end
end
