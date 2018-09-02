Rails.application.routes.draw do
  get '/dashboard', to: 'dashboard#home'
  root 'dashboard#home'
  resources :tickets
  resources :customers
  resources :statuses
  resources :priorities
  devise_for :users
end
