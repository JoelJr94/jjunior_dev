Rails.application.routes.draw do
  root "posts#index"
  
  resources :categories, except: [:show]
  resources :posts
  devise_for :users
end
