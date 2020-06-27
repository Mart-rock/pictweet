Rails.application.routes.draw do
  devise_for :users
  root to: 'tweets#index'
  namespace :tweets do
    resources :searches, only: :index
  end
  resources :tweets do
    resources :comments, only: :create
  end
  resources :users, only: :show do
  end
  post '/tweets/:tweet_id/likes' => "likes#create"
  delete '/tweets/:tweet_id/likes' => "likes#destroy"

end
    
