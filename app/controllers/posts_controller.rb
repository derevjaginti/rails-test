class PostsController < ApplicationController

  before_filter :authenticate_user!, :except => [:show,:index]  

  layout :determine_layout

  def determine_layout
    case action_name
    when "index" 
      user_signed_in? ? "user_layout" : "guest_layout"
    when "show"
      user_signed_in? ? "user_layout" : "guest_layout"
    else
      "user_layout"
    end
  end


  def index
    if params[:tag].present? 
      @posts = Post.tagged_with(params[:tag])
    elsif params[:username].present?
      user = User.where(name: params[:username])
      @posts = Post.where(user_id: user.id)
    else
      @posts = Post.all
    end  
  end


  def show 
    @post = Post.find(params[:id])
    @comments = Comment.where(post: params[:id])
  end


  def new
    @post = Post.new
  end


  def edit
    @post = Post.find(params[:id])
  end


  def create
    @post = current_user.posts.build(params[:post])
    
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render action: "new"
    end    
  end


  def update
    @post = Post.find(params[:id])
    
    if @post.update_attributes(params[:post])
      redirect_to @post, notice: 'Post was successfully updated.' 
    else
      render action: "edit"
    end
  end



  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to '/', notice: 'Post was successfully deleted.'    
  end

end
