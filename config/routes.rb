Rails.application.routes.draw do
  devise_for :users, controllers: {
    confirmations: 'confirmations'
  }
  
  root to: 'wednesday#index'
  resources :asset, except: [:index, :destroy]

  namespace :admin do
    resources :users
  end
end