Rails.application.routes.draw do
  root "categories#index"

  resources :categories, only: [:show]
  resources :cart_items, except: [:show, :update, :edit, :new]

  get    "/cart", to: "carts#show"
  delete "/cart/destroy", to: "carts#delete"
  put    "/cart/update", to: "carts#update"

  resources :users, only: [:new, :create]

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
end
