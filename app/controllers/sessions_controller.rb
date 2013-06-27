class SessionsController < ApplicationController

  def create
    @originpath = params[:originpath]
    @originpath = root_path unless @originpath
    return unless params[:password]
    if params[:password] == password
      session[:role] = 'admin'
      flash[:notice] = 'Successfully logged in'
      redirect_to @originpath
    else
      session[:role] = nil
      flash[:error] = 'Incorrect password'
      render :create
    end
  end

  def destroy
    session[:role] = nil
    flash[:notice] = 'Logged out'
    if params[:originpath]
      redirect_to params[:originpath]
    else
      redirect_to root_path
    end
  end

  private

  def password
    ENV['BGP_ADMIN_PASSWORD']
  end

end
