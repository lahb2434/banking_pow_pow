Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show] do
    resources :accounts, only: [:new, :create, :show]
  end
  resources :accounts
  resources :sessions, only: [:create]
  get '/home', to: 'site#home'
  get '/welcome', to: 'site#welcome'
  root 'site#welcome'

  get '/users/auth/facebook/callback' => 'sessions#create'
  # get '/auth/face/callback', to: 'sessions#create'

  devise_for :users
end
