Rails.application.routes.draw do
  root 'dashboard#index'

  resources :comments
  resources :tickets

  get 'tickets/customer/(:customer_id)' => "tickets#index", as: :customer_tickets
  get 'tickets/status/(:status_id)'     => "tickets#index", as: :status_tickets
  get 'tickets/priority/(:priority_id)' => "tickets#index", as: :priority_tickets
  get 'tickets/user/(:user_id)'         => "tickets#index", as: :user_tickets

  resources :customers
  resources :statuses
  resources :priorities

  devise_for :users, :skip => [:registrations], controllers: {
    sessions: 'users/sessions'
  }

  get 'dashboard/' => 'dashboard#index', as: :dashboard

  get 'analists'                  => "analists#index", as: :analists
  get 'analists/:analist_id'      => "analists#show", as: :analist
  get 'new_analist'               => "analists#new", as: :new_analist
  post 'create_analist'           => "analists#create", as: :create_analist
  get 'edit_analist/:analist_id'  => 'analists#edit', as: :edit_analist
  patch 'update_analist'          => 'analists#update', as: :update_analist
  #delete 'analist#delete'
end
