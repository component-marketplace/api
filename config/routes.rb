# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    get 'batch_action/destroy'
  end
  get 'batch_action/destroy'
  scope module: 'admin', path: 'admin' do
    root 'items#index'
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
    resources :batch_action, only: [] do
      collection do
        delete :batch_destroy
      end
    end
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
