Rails.application.routes.draw do
  get 'home/index'

  devise_for :users
  resources :products do
    resources :reviews, except: [:index, :show]
  end
  root to: 'home#index'
end
