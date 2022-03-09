Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :meals do
    resources :orders, only: [:show, :create] do
      resources :meal_orders, only: [:show , :destroy, :index, :create, :update ]
    end
  end
end
