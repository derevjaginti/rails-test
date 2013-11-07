require 'factory_girl'

FactoryGirl.define  do 

  factory :user do 
    sequence(:name) { |n| "#{n}" }
    sequence(:email) { |n| "tesst#{n}@example.com" }
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
