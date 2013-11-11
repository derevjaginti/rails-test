class CommentsController < ApplicationController
	
	def create

    if current_user
      @comment = current_user.comments.build(params[:comment])
    else
      @comment = guest_user.comments.build(params[:comment])
    end

    if @comment.save
      redirect_to :controller => "posts", 
                  :action => "show", 
                  :id => @comment.post
    end
  end

end
