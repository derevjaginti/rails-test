require 'factory_girl'

FactoryGirl.define  do 

  sequence(:email) { |n| "test#{n}@email.com" }

  factory :user do 
    sequence(:name) { |n| "#{n}" }
    email { FactoryGirl.generate(:email) }
    password "passwordpassword"
    password_confirmation "passwordpassword"
  end  

  factory :post do 
    user_id 1
    user FactoryGirl.create(:user, :name =>"name", :email=>"test@email.com") 
    sequence(:body) { |n| "#{n}" }
    sequence(:title) { |n| "#{n}" }
  end

end