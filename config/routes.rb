Rails.application.routes.draw do
  resources :experiences do
    resources :responses
  end
  root to: 'experiences#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
