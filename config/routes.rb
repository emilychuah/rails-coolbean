Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :meals do
    resources :orders, only: [:show, :create]
  end

  resources :meal_orders, only: [:show , :destroy, :create, :update ]
  get 'cart', to: 'meal_orders#index', as: :cart
end
