Rails.application.routes.draw do

  devise_for :users, :controllers => {:registrations => "registrations"}

  root to: 'pages#home'

  get 'profile', to: "users#show", as: "profile"

  resources :mountains, only: [:index]

  resources :experiences, only: [:show, :index, :new, :create] do
    resources :bookings, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
