class CommentsController < ApplicationController
	
	def create
    @comment = current_user.comments.build(params[:comment])
    
    if @comment.save
      redirect_to :controller => "posts", :action => "show", :id => @comment.post
    end
    
  end
end
