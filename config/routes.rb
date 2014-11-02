Rails.application.routes.draw do
  resource :user, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]
  resources :subs
  resources :posts
  resources :comments
  resources :profiles
  root 'posts#index'
end
