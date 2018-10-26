Rails.application.routes.draw do
  root 'dashboard#home'
  resources :comments
  get '/dashboard', to: 'dashboard#home'
  resources :tickets
  get 'tickets/customer/(:customer_id)' => "tickets#index", as: :customer_tickets
  get 'tickets/status/(:status_id)'     => "tickets#index", as: :status_tickets
  get 'tickets/priority/(:priority_id)' => "tickets#index", as: :priority_tickets
  get 'tickets/user/(:user_id)'         => "tickets#index", as: :user_tickets
  resources :customers
  #resources :users
  resources :statuses
  resources :priorities
  devise_for :users, :skip => [:registrations], controllers: {
    sessions: 'users/sessions'
  }
end
