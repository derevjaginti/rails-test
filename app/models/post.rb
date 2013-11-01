class Post < ActiveRecord::Base
  attr_accessible :id, :user, :body, :title, :created_at, :tag_list
  unless (ARGV & ['assets:precompile', 'assets:clean']).any?
    acts_as_taggable_on :tags
  end
end
