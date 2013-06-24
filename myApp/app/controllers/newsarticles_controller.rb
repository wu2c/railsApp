class NewsarticlesController < ApplicationController
  before_filter :authenticate, :except => [:index, :show]
  before_filter :check_owner, :except => [:index, :show, :new, :create]
  
  # GET /newsarticles
  # GET /newsarticles.json
  respond_to :html,:js,:xml
  def index
    @newsarticles = Newsarticle.all

    respond_with @newsarticles
  end

  # GET /newsarticles/1
  # GET /newsarticles/1.json
  def show
    @newsarticle = Newsarticle.find(params[:id])

    respond_with @newsarticle
  end

  # GET /newsarticles/new
  # GET /newsarticles/new.json
  def new	
    @newsarticle = Newsarticle.new
	@newsarticle.name = current_user.email
	@newsarticle.tags.build
    respond_with @newsarticle
  end

  # GET /newsarticles/1/edit
  def edit
    @newsarticle = Newsarticle.find(params[:id])
  end

  # POST /newsarticles
  # POST /newsarticles.json
  def create
    @newsarticle = Newsarticle.new(params[:newsarticle])
	@newsarticle.name = current_user.email
      if @newsarticle.save
        redirect_to :action=> :show, :id =>@newsarticle.id
      else
        render :action=> "new"   
      end

  end

  # PUT /newsarticles/1
  # PUT /newsarticles/1.json
  def update
    @newsarticle = Newsarticle.find(params[:id]) 
	 
      if @newsarticle.update_attributes(params[:newsarticle])
        respond_with @newsarticle, :notice=> 'Newsarticle was successfully updated.'
      else
        render :action=> "edit"        
      end
  end

  # DELETE /newsarticles/1
  # DELETE /newsarticles/1.json
  def destroy
    @newsarticle = Newsarticle.find(params[:id])
    @newsarticle.destroy

    respond_with @newsarticle
  end
  
  # helper method to check whether the current user can manipulate articles
  def check_owner
  	@newsarticle = Newsarticle.find(params[:id])
  	if @newsarticle.name == current_user.email
		return true
	else
		redirect_to :back, :notice=> "You are not allowed to make any changes to this article!"
	end
  end
  
end
