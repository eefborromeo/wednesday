Rails.application.routes.draw do
  devise_for :users, controllers: {
    confirmations: 'confirmations'
  }
  
  root to: 'wednesday#index'
  namespace :admin do
    resources :wednesday, only: [:index]
  end
end