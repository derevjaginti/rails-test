RailsTest::Application.routes.draw do
  
  resources :posts

  resources :comments

  match '/' => 'posts#index', :as => 'index'

  devise_for :users
end
