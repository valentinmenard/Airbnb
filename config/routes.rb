Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  resources :users, only: [:show]

  resources :flats, only: [:index, :show] do
    resources :bookings, only: [:new, :create]
  end

  namespace :account do
    resources :bookings, only: [:index, :create, :new, :show]
    resources :flats, only: [:index, :new, :create, :show, :edit, :update]
  end
end
