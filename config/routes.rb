Rails.application.routes.draw do
  devise_for :users
  resources :products do
    resources :reviews, except: [:index, :show]
  end
  root to: 'products#index'
end
