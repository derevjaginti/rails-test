class Post < ActiveRecord::Base
  attr_accessible :user_id, :body, :title, :created_at, :tag_list
  acts_as_taggable_on :tags
  acts_as_taggable

  belongs_to :user

  validates_presence_of :title, :body
end
