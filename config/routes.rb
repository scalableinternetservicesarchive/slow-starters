Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :listings do
    resources :messages
    resources :reservations
  end
  resources :users, only: [:show]
  root "listings#index"
  get 'search', to:'listings#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
