Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :meals do
    resources :meal_orders, only: [:create, :new]
  end
  resources :orders
  resources :meal_orders, only: [:show , :destroy, :update ]
  get 'cart', to: 'meal_orders#index', as: :cart
end
