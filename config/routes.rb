Rails.application.routes.draw do
  get 'users/hosts'
  get 'users/venueowners'
  get "venues/myvenue"
  get "home", to: "events#home", as: :home
  root to: "events#home"
  get "events/index", to: "events#index", as: :role
  devise_for :users, controllers: {
          registrations: 'users/registrations'
        }
  # devise_for :users
  resources :events
  resources :causes
  resources :venues
  resources :users
  resources :areas
  post "requests/create"
  get "requests/index"
  resources :charges


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
