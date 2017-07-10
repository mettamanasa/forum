Rails.application.routes.draw do
  devise_for :users
     resources :searches
	 resources  :posts do 
	 	resources :comments
	 end
	 resources :posts 
        resources :lists
  root "posts#index"
end
