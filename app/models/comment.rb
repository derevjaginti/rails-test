class Comment < ActiveRecord::Base
  attr_accessible :user, :post, :body
end
