Rails.application.routes.draw do
  root to: 'products#index'

  resources :products, only: [:index, :show] do
    resources :reviews, only: [:create, :destroy]
  end
  resources :categories, only: [:show]
  resources :about, only: [:index]

  resource :cart, only: [:show] do
    post   :add_item
    post   :remove_item
  end

  resources :orders, only: [:create, :show]
  resources :users, only: [:new, :create]

  # Session controller routes
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  namespace :admin do
    root to: 'dashboard#show'
    resources :products, except: [:edit, :update, :show]
    resources :categories, except: [:edit, :update, :show, :destroy]
  end

end
