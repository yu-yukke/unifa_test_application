Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "sessions#new"

  get 'oauth/callback', to: 'oauth/callbacks#index'

  resource :authenticate, only: [:show]

  resource :session, only: [:new, :create, :destroy]

  resources :posts, only: [:index, :new, :create]
end
