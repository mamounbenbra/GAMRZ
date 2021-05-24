Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:show, :index] do
    resources :reviews, only: [:new, :create]
    resources :matches, only: [:new, :create]
  end
end
