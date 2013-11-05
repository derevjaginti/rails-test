require "spec_helper"

describe PostsController do

  before(:each) do
    @post1, @post2 = Post.new, Post.new
    @post1.id, @post2.id = "1", "2"
    @post1.title, @post2.title = "title1", "title2"
    @post1.body, @post2.body = "body1", "body2"
    @post1.user, @post2.user = "user1", "user2"
    @post1.save
    @post2.save
  end

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
      get :index
      expect(assigns(:posts)).to match_array([@post1, @post2])
    end

    it "loads posts of the one user into @posts" do
      get :index , :username => @post1.user
      expect(assigns(:posts)).to match_array([@post1])
    end
  end

  describe "GET #show" do
    it "responds successfully with an HTTP 200 status code" do
      get "show", :id => "1"
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the index template" do
      get "show", :id => "1"
      expect(response).to render_template("show")
    end
  end

end