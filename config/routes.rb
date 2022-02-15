Rails.application.routes.draw do
  devise_for :users
  root 'splashes#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :splashes, only: [:index]
  resources :users
  resources :groups, except: [:edit, :update]

  # Defines the root path route ("/")
  # root "articles#index"
end
