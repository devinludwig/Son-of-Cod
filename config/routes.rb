Rails.application.routes.draw do
  get 'reviews/new'

  get 'reviews/edit'

  devise_for :users
  resources :products
  resources :users
  root to: 'products#index'
end
