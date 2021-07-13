Rails.application.routes.draw do

  resources :users, only: [:new, :create, :show] do
    resources :accounts, only: [:new, :create, :index, :show]
    resources :cards, only: [:show]
  end

  resources :accounts do
    resources :cards, only: [:show]
  end

  resources :cards 

  resources :sessions, only: [:create]

  
  
  get '/welcome', to: 'site#welcome'
  

  get '/users/auth/facebook/callback' => 'sessions#create'

  devise_for :users

  root 'site#welcome'
end
