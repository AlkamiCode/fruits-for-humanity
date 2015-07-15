Rails.application.routes.draw do
  root "categories#index"

  resources :categories, only: [:show]
  resources :cart_items, except: [:show, :update, :edit, :new]

  get    "/cart", to: "carts#show"
  delete "/cart/destroy", to: "carts#delete"
  put    "/cart/update", to: "carts#update"

  resources :users, only: [:create]
  resources :orders, only: [:create]

  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
