RailsTest::Application.routes.draw do
  
  resources :posts do
  	get 'show_user'
	end

	match  '/show_user', :controller => 'posts', :action => 'show_user'
  
  devise_for :users

  root :to => "posts#index"
end
