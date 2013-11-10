require "spec_helper"

describe PostsController do

  before(:each) do
    @post1 = FactoryGirl.create(:post)
    @post2 = FactoryGirl.create(:post)  
  end

  
  describe "GET #index" do
    it "responds successfully with an HTTP 200" do
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
    it "responds successfully with an HTTP 200" do
      get "show", :id => @post1.id
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the index template" do
      get "show", :id => @post2.id
      expect(response).to render_template("show")
    end

    it "loads all of the comments into @comments for post1" do      
      @comment1 = FactoryGirl.create(:comment, :post => @post1.id)
      @comment2 = FactoryGirl.create(:comment, :post => @post1.id)
      get "show", :id => @post1.id
      expect(assigns(:comments)).to match_array([@comment1,@comment2])
    end
  end

  
  describe "GET #new" do
    describe "if not logged in" do
      it "redirect" do
        get "new"
        expect(response.status).to eq(302)
      end
    end

    describe "if logged in" do
      before(:each) do
        @user = FactoryGirl.create(:user, email: "email@test.test")
        sign_in @user  
      end

      it "responds successfully with an HTTP 200" do    
        get "new"
        expect(response).to be_success
        expect(response.status).to eq(200)
      end
    end
  end


  describe "GET #edit" do
    describe "if not logged in" do
      it "redirect" do
        get "edit", :id => @post1.id
        expect(response.status).to eq(302)
      end
    end

    describe "if logged in" do
      before(:each) do
        @user = FactoryGirl.create(:user, email: "email@test.test")
        sign_in @user  
      end
        
      it "responds successfully with an HTTP 200" do
        get "edit", :id => @post1.id
        expect(response).to be_success
        expect(response.status).to eq(200)
      end

      it "load post into @post" do 
        get "edit", :id => @post1.id
        expect(assigns(:post)).to eq(@post1)
      end
    end
  end


  describe "POST #create" do
    describe "if not logged in" do
      it "redirect" do
        post "create"
        expect(response.status).to eq(302)
      end
    end

    describe "if logged in" do
      before(:each) do
        @user = FactoryGirl.create(:user, email: "email@test.test")
        sign_in @user  
      end
      
      it "responds successfully with an HTTP 200" do
        post "create"
        expect(response).to be_success
        expect(response.status).to eq(200)
      end
      
      it "should save" do
        new_post = FactoryGirl.build :post  
        post "create", :post => new_post.attributes

        specify { @new_post.save.should == false }
      end
    end
  end


end