Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks" }
  resources :users, only: [:edit, :update] do
    collection do
      get 'profile'
      get 'bookings_sent'
    end
  end

  resources :flats, only: [:index, :show] do

    resources :bookings, only: [:index, :new, :create, :update]
  end

  namespace :account do
    resources :bookings, only: [] do
      collection do
        get 'bookings_received'
      end
    end
    resources :flats, only: [:index, :new, :create, :show, :edit, :update]
  end
end
