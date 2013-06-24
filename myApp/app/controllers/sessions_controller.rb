class SessionsController < ApplicationController
	respond_to :html,:js,:xml
	  def new
	  end
	
	  def create
		  user = User.find_by_email(params[:email])
		  if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to root_url, :notice => "Logged in!"
		  else
			flash[:alert] = "Invalid email or password"
			render "new"
		  end
	  end
	
	# DELETE /sessions/1
  	# DELETE /sessions/1.json
	  def destroy
		session[:user_id] = nil
		redirect_to root_url, :notice => "Logged out!"
	  end

end
