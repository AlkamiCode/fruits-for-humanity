Rails.application.routes.draw do
  root "categories#index"

  resources :categories, only: [:show]
  resources :cart_items, except: [:show, :update, :edit, :new]

  get    "/cart", to: "carts#show"
  delete "/cart/destroy", to: "carts#delete"
  put    "/cart/update", to: "carts#update"

  resources :users, only: [:create]

  namespace :user do
    resources :orders, only: [:create, :index]
  end

  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  namespace :admin, only: [:show] do
    resources :items, only: [:create, :new]
    resources :orders, only: [:index]
  end
end
