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

  private

  def safe_params
    params.require(:driver).permit(:name)
  end
end
