class UsersController < ApplicationController
	respond_to :html,:js,:xml	
  
    # GET /users/new
    # GET /users/new.json
	def new
		@user = User.new
		respond_with @user
	end
	
    # POST /newsarticles
    # POST /newsarticles.json
	def create
		@user = User.new(params[:user])
		@user.password_digest = "this is text wellington eryu for pw digest"
		if @user.save
			session[:user_id] = @user.id
			redirect_to root_url, :notice => "New user signed up!"
		else
			render :action=> "new"
		end
	end
end
