require "spec_helper"

describe PostsController do

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the posts into @posts" do
      post1, post2 = Post.new, Post.new
      post1.title, post2.title = "title1", "title2"
      post1.body, post2.body = "body1", "body2"
      post1.save
      post2.save
      
      get :index
      expect(assigns(:posts)).to match_array([post1, post2])
    
    end

  end
end