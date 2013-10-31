class Post < ActiveRecord::Base
  attr_accessible :id, :user, :body, :title, :created_at
end
