class CommentsController < ApplicationController
respond_to :html,:js,:xml
	def create 
		@newsarticle = Newsarticle.find(params[:newsarticle_id])
		@comment = @newsarticle.comments.create(params[:comment])
		respond_with @newsarticle
	end 
end
