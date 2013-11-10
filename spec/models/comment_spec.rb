require 'spec_helper'

describe Comment do
  before(:each) do
    @comment = Comment.new
  end

  it "should require body" do
    @comment.body = nil
    @comment.should_not be_valid
  end

end