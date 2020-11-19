Rails.application.routes.draw do
  
  root to: "public#main"
  
  resources :experiences do
    resources :questions
  end
  devise_for :users
  resources :todo_lists do
	    resources :todo_items
  end

  resources :experiences do
    resources :rates
  end
  resources :experiences do
    resources :responses
  end

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #root to: "experiences#index"
  
  
  #map.log_out 'logout', :controller => 'sessions', :action => 'destroy'
end
