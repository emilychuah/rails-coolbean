Rails.application.routes.draw do
  devise_for :users
  root to: 'meals#home'
  resources :meals do
    resources :orders, only: [:show, :create]
  end

  resources :meal_orders, only: [:create, :update, :destroy ]
  get 'cart', to: 'meal_orders#index', as: :cart
end
