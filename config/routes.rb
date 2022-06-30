Rails.application.routes.draw do
  namespace :admin do
    resources :transactions, only:[:index]
  end
  devise_for :users, controllers: {
    confirmations: 'confirmations'
  }
  
  root to: 'wednesday#index'
  resources :asset, except: [:destroy]
  resources :transaction, only: [:new]

  namespace :admin do
    resources :users
  end
end