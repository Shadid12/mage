Rails.application.routes.draw do
  resources :listings
  devise_for :users, :controllers => { registrations: 'registrations' }
  root 'static#index'
  get '/cleaning', to: 'static#cleaning'
  post '/update_user_location', to: 'static#update_user_location'
  get '/cleaning_list', to: 'static#cleaning_list'
  resources :crecits, only: [:index, :new, :create, :show]
  resources :messages, only: [:create]
end
