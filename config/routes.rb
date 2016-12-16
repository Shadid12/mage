Rails.application.routes.draw do
  resources :listings
  devise_for :users, :controllers => { registrations: 'registrations' }
  root 'static#index'
end
