Rails.application.routes.draw do
  resources :categories
  root "posts#index"
  
  resources :posts
  devise_for :users
end
