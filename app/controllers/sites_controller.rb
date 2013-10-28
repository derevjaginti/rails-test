class SitesController < ApplicationController
	protect_from_forgery
	
  layout :determine_layout

  # GET /posts
  # GET /posts.json
	def index
    @posts = Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

	def determine_layout
		user_signed_in? ? "user_layout" : "guest_layout"
	end

end
