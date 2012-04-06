class DriversController < ApplicationController
  before_filter :authorize, :only => [:create, :update, :destroy]
  # GET /drivers
  def index
    @drivers = Driver.all
  end

  # GET /drivers/1
  def show
    @driver = Driver.find(params[:id])
  end

  # GET /drivers/new
  def new
    @driver = Driver.new
  end
end
