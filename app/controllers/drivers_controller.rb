class DriversController < ApplicationController
  before_filter :authorize, only: [:create, :update, :destroy]

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

  def edit
    @driver = Driver.find(params[:id])
  end

  def update
    @driver = Driver.find(params[:id])
    @driver.update_attributes!(safe_params)
    flash[:notice] = "Driver #{@driver.name} updated"
    redirect_to(drivers_path)
  end

  def create
    @driver = Driver.new(safe_params)
    if @driver.save
      flash[:notice] = "Driver #{@driver.name} created"
      redirect_to(drivers_path)
    else
      flash[:error] = 'Driver could not be created'
      render action: 'new'
    end
  end

  private

  def safe_params
    params[:driver].permit(:name, :player_id)
  end
end
