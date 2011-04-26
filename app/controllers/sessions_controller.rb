class SessionsController < ApplicationController

  def create
    return unless params[:password]
    if params[:password] == 'foobar'
      session[:role] = 'admin'
      flash[:notice] = 'Successfully logged in'
      redirect_to root_path   
    else
      session[:role] = nil
      flash[:error] = 'Incorrect password'
      render :create
    end
  end

  def destroy
    session[:role] = nil
    flash[:notice] = 'Logged out'
    redirect_to root_path
  end

end
