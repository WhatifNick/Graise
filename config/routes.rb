Rails.application.routes.draw do
  get 'users/hosts'
  get 'users/venueowners'
  devise_for :users, controllers: {
          registrations: 'users/registrations'
        }
  # devise_for :users
  resources :events
  resources :causes
  resources :venues
  resources :users
  resources :areas
  root to: 'events#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
