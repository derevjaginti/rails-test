class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :id, :name,:email, :password, :password_confirmation, :remember_me

  has_many :posts
  has_many :comments

end
