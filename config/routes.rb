Rails.application.routes.draw do

  resources :users, only: [:new, :create, :show] do
    resources :accounts, only: [:new, :create, :index, :show]
    resources :cards, only: [:show]
    get '/total_debt', to: 'site#total_debt'
  end

  resources :accounts do
    resources :cards, only: [:show]
  end

  resources :cards 

  resources :sessions, only: [:create]

  get '/logout', to: 'sessions#logout'
  
  get '/welcome', to: 'site#welcome'
  
  get '/store', to: 'merchandise#show'
  get '/users/auth/facebook/callback' => 'sessions#create'

  devise_for :users

  root 'site#welcome'
end
