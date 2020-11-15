Rails.application.routes.draw do
  devise_for :users
  resources :todo_lists do
	    resources :todo_items
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "todo_lists#index"
  
  #map.log_out 'logout', :controller => 'sessions', :action => 'destroy'
end
