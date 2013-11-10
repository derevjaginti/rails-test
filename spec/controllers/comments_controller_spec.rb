require "spec_helper"

describe CommentsController do

  describe "POST #create" do
    it "should update" do
      @post = FactoryGirl.create(:post)
      @attr = { :post => @post.id, :body => "body"} 
      put "create", :comment => @attr
      flash[:notice].should =~ /comment was successfully created./i
      response.should redirect_to "/posts"+@post.id+"/show"
    end
  end
end