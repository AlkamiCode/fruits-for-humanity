Rails.application.routes.draw do
  root "categories#index"

  resources :categories, only: [:show]
  resources :cart_items, only: [:update, :destroy, :create]

  get    "/cart", to: "cart_items#index"
  delete "/cart/destroy", to: "carts#delete"

  resources :users, only: [:create]
  resources :notifications, only: [:create]

  namespace :user do
    resources :orders, only: [:create, :index]
  end

  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  namespace :admin, only: [:show] do
    resources :categories, only: [:show, :index, :update]
    resources :items, only: [:create, :update]
    resources :orders, only: [:index]
  end

  resources :charges, only: [:new, :create]
end
