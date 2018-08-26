Rails.application.routes.draw do
  resources :tickets
  resources :customers
  resources :statuses
  resources :priorities
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
