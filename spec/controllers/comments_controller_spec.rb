require "spec_helper"

describe CommentsController do

  describe "POST #create" do
    it "should update" do
      @post = FactoryGirl.create(:post)
      @attr = { :post => @post.id, :body => "body"} 
      put "create", :comment => @attr
      response.should redirect_to "/posts/"+@post.id.to_s 
    end
  end
end