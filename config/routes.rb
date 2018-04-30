Rails.application.routes.draw do
  resources :events
  resources :causes
  resources :venues
  resources :users
  resources :areas
  root to: 'events#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
