RailsTest::Application.routes.draw do
  
  resources :posts do
  	get 'show_user'
	end
	match  '/show_user', :controller => 'posts', :action => 'show_user'
  
  resources :comments

  match '/' => 'posts#index', :as => 'index'

  devise_for :users
end
