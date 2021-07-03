Rails.application.routes.draw do
  resources :accounts, only: [:show]
  resources :users  #, only: [:new, :create]
  # post '/' => 'sessions#create'
  root 'site#welcome'
end
