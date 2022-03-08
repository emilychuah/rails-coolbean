Rails.application.routes.draw do
  devise_for :users
  root to: 'meals#home'
  resources :meals do
    resources :orders, only: [:show, :create]
  end
end
