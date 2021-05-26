Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:show, :index] do
    resources :reviews, only: [:new, :create]
    resources :matches, only: [:new, :create, :index]
  end
  resources :chatrooms, only: [:show, :index] do
    resources :messages, only: :create
  end
  get "approve/:id", to: "users#like", as: :approve_user
  get "dislike/:id", to: "users#dislike", as: :dislike_user
end
