class Comment < ActiveRecord::Base
  attr_accessible :user, :post, :body

  def self.who_is(user)
  	user ? user.username : "Anonymous"
  end
end
