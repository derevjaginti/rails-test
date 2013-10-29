RailsTest::Application.routes.draw do
  
  resources :posts

  devise_for :users
  devise_for :users, controllers: { posts: "posts" }
  
	root :to => "sites#index"
end
