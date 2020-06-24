Rails.application.routes.draw do
  devise_for :users
  root to: 'tweets#index'
  namespace :tweets do
    resources :searches, only: :index
  end
  resources :tweets do
    resources :comments, only: :create
    resources :likes, only: [:create, :destroy]
  end
  resources :users, only: :show do
    resources :likes, only: [:create, :destroy]
  end
end
    
