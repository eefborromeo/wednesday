Rails.application.routes.draw do
  devise_for :users, controllers: {
    confirmations: 'confirmations'
  }
  
  root to: 'pages#index'
  get '/admin', action: :admin, controller: 'pages'
end