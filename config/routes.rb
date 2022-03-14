Rails.application.routes.draw do
  devise_for :users
  root to: 'meals#home'
  resources :meals, only: [:home, :index, :show] do
    resources :meal_orders, only: [:create, :new]
  end
  resources :orders, only: [:show]
  get 'cart', to: 'meal_orders#index', as: :cart

  # get 'dashboard', to: 'dashboard#dashboard', as: :dashboard
  # patch 'toggle_home_cook', to: 'users#toggle_home_cook', as: :toggle_home_cook
end
