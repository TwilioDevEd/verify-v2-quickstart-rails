Rails.application.routes.draw do
  get 'main/index'

  resources :users, only: [:new, :create, :show, :index, :destroy]
  resources :sessions, only: [:new, :create, :destroy]

  get 'verify', to: 'users#verify', as: 'verify'
  post 'verify', to: 'users#verify'
  get 'register', to: 'users#new', as: 'register'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  root 'main#index'
end
