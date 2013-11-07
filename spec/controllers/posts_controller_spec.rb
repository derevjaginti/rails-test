require "spec_helper"

describe PostsController do

  before(:each) do
    @post1 = FactoryGirl.create(:post, :title =>"title", :body=>"body")
    @post2 = FactoryGirl.create(:post, :title =>"title", :body=>"body")  
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
      get :index , :username => @post1.user.name
      expect(assigns(:posts)).to match_array([@post1])
    end
  end

  describe "GET #show" do
    it "responds successfully with an HTTP 200 status code" do
      get "show", :id => @post1.id
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the index template" do
      get "show", :id => @post2.id
      expect(response).to render_template("show")
    end
  end

end