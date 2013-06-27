class HomeController < ApplicationController
  def index
    @seasons = Season.order(:name)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @seasons }
    end
  end

end
