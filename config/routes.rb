Rails.application.routes.draw do
  resources :cart_items
  devise_for :customers
  root 'products#index'
  resources :categories
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end