require 'factory_girl'

FactoryGirl.define  do 

  factory :user do 
    name Faker::Name.name
    email Faker::Internet.email
    password "passwordpassword"
    password_confirmation "passwordpassword"
  end  

  factory :post do 
    user_id 1
    user FactoryGirl.create(:user) 
    title Faker::Lorem.words(3) 
    body Faker::Lorem.paragraphs(3)
  end

  factory :comment do 
    user_id 1
    post 1
    body Faker::Lorem.paragraphs(3)
  end

end
