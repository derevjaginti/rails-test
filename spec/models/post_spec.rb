require 'spec_helper'

describe Post do
	before(:each) do
		@post = Post.new
	end

	it "should require title" do
		@post.title = nil
		@post.should_not be_valid
	end

	it "should require body" do
		@post.body = nil
		@post.should_not be_valid
	end

end