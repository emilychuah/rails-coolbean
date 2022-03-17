Rails.application.routes.draw do
  devise_for :users
  root to: 'meals#home'
  resources :meals do
    resources :meal_orders, only: [:create, :new]
    resources :reviews, only: :create
  end
  resources :meal_orders, only: [:destroy]
  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
  end
  resources :users do
    resources :orders, :meals
  end
  get 'cart', to: 'meal_orders#index', as: :cart
  resources :reviews, only: :destroy

  # get 'dashboard', to: 'dashboard#dashboard', as: :dashboard
  # patch 'toggle_home_cook', to: 'users#toggle_home_cook', as: :toggle_home_cook
end
