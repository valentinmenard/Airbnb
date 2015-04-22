Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  resources :users, only: [ ] do
    collection do
      get 'profile'
      get 'my_flats'
    end
  end

  resources :flats, only: [:index, :show] do
    resources :bookings, only: [:index, :new, :create]
  end

  namespace :account do
    resources :bookings, only: [:index]
    resources :flats
  end
end
