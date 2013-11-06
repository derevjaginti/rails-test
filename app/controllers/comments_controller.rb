class CommentsController < ApplicationController
	
  def create
    @comment = Comment.create(params[:comment])
    
    @comment.user = Comment.who_is(current_user)
    
    respond_to do |format|
      if @comment.save
        format.html { redirect_to :controller => "posts", :action => "show", :id => @comment.post}
      else
        format.html
      end
    end
  end

end
