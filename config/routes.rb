Rails.application.routes.draw do
  namespace :admin do
    resources :transactions, only:[:index]
  end
  devise_for :users, controllers: {
    confirmations: 'confirmations'
  }
  
  root to: 'wednesday#index'
  resources :asset, except: [:destroy]

  resources :transaction, only: [:index, :create]
  get '/transaction/new/:id' => 'transaction#new', as: 'new_transaction'
  
  get '/sell/new/:id' => 'sell#new', as: 'new_sell'

  namespace :admin do
    resources :users
  end
end