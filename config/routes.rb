Rails.application.routes.draw do
  devise_for :users
  # root 'splashes#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  authenticated :user do
    root 'groups#index', as: :authenticated_root
  end

  unauthenticated :user do
    root to: 'splashes#index'
  end

  resources :splashes, only: [:index]
  resources :users
  resources :groups, except: [:edit, :update] do
    resources :entities, except: [:edit, :update]
  end

  # Defines the root path route ("/")
  # root "articles#index"
end
