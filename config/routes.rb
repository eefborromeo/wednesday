Rails.application.routes.draw do
  devise_for :users, controllers: {
    confirmations: 'confirmations'
  }
  
  root to: 'wednesday#index'
  namespace :admin do
    resources :users
  end
end