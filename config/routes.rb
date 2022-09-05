Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#index'
  resources :admin_session, only: [:new, :create, :destroy]
  resources :furniture_items
  resources :admin_users
end
