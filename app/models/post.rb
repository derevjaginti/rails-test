class Post < ActiveRecord::Base
  attr_accessible :user, :body, :title, :created_at, :tag_list
  acts_as_taggable_on :tags
  acts_as_taggable
end
