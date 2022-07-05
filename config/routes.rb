Rails.application.routes.draw do
  namespace :admin do
    resources :transactions, only:[:index]
  end

  devise_for :users, controllers: {
    confirmations: 'confirmations'
  }
  
  root to: 'wednesday#index'

  resources :user, only: [:edit, :update]

  get '/user/:id/edit/money', to: 'user#edit_money', as: 'edit_user_money'
  patch '/user/:id/money', to: 'user#update_money', as: 'user_money'

  resources :asset, except: [:destroy]

  resources :transaction, only: [:index, :create]
  get '/transaction/new/:id' => 'transaction#new', as: 'new_transaction'
  
  resources :sell, only: [:create]
  get '/sell/new/:id' => 'sell#new', as: 'new_sell'

  namespace :admin do
    resources :users
  end
end