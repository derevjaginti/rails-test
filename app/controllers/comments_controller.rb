class CommentsController < ApplicationController
	
	def create
    @comment = Comment.create(params[:comment])
    
    current_user ? @comment.user = current_user.username : @comment.user = "Anonymous"

    respond_to do |format|
      if @comment.save
        format.html { redirect_to :controller => "posts", :action => "show", :id => @comment.post}
      else
        format.html
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

end
