Rails.application.routes.draw do
  root "categories#index"
  resources :categories, only: [:show]
  resources :cart_items, only: [:create]

  get    "/cart", to: "carts#show"
  delete "/cart/destroy", to: "carts#delete"
  put    "/cart/update", to: "carts#update"
end
