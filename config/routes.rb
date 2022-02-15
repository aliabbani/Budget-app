Rails.application.routes.draw do
  get 'groups/index'
  get 'groups/show'
  get 'groups/new'
  get 'groups/create'
  get 'groups/destroy'
  devise_for :users
  root 'splashes#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  authenticated :user do
    root 'groups#index', as: :authenticated_root
  end

  resources :splashes, only: [:index]
  resources :users
  resources :groups, except: [:edit, :update]

  # Defines the root path route ("/")
  # root "articles#index"
end
