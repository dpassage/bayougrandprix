class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :admin?
  helper_method :logged_in_as

  def authorize
    unless admin?
      flash[:error] = "unauthorized access"
      redirect_to root_path
      false
    end
  end

  def admin?
    session[:role] == 'admin'
  end

  def logged_in_as
    if admin?
      "admin"
    else
      "guest"
    end
  end
end
