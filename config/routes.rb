Rails.application.routes.draw do
  get 'conversations/index'

  get 'conversations/new'

  get 'conversations/show'

  get "home/index"
  root "home#index"
  
  get "signup", to: "users#new", as: "signup"
  resources :users
 
  resources :sessions, only: [:new, :create, :destroy]
  get "login", to: "sessions#new", as: "login"
  get "logout", to: "sessions#destroy", as: "logout"
end
