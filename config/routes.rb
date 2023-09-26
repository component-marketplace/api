Rails.application.routes.draw do
  root 'home#index'

  scope module: 'admin', path: 'admin' do
    resources :admin_session, only: %i[new create destroy]
    resources :items
    resources :admin_users
    resources :item_components
    resources :suppliers
    resources :users
    resources :purchase_receipts
    resources :sale_receipts
    resources :organizations
    resources :item_subscribers
  end

  namespace :v1 do
    resources :items
    resources :item_components
    resources :suppliers
    resources :purchase_receipts
    resources :sale_receipts
    resources :organizations
    resources :item_subscribers
  end
end
