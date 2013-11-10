class Comment < ActiveRecord::Base
  attr_accessible :post, :body

  belongs_to :user

  validates_presence_of :body
end
