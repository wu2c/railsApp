class ApplicationController < ActionController::Base
  protect_from_forgery
  force_ssl
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
  
  def authenticate
  	if session[:user_id]
		return true
	else
		flash[:alert] = "You need to log in first! Or register, if don't have an account."
		redirect_to sessions_new_url and return false
	end
  end
  
 
end
