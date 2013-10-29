class Post < ActiveRecord::Base
  attr_accessible :user,:body, :title, :created_at
end
