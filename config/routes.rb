Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  root to: "pages#home"

  resources :users, only: [:show]

  resources :flats, only: [:index, :show] do
    resources :bookings, only: [:new, :create]
  end

  namespace :account do
    resources :bookings, only: [:index, :create, :new, :show]
    resources :flats, only: [:index, :new, :create, :show, :edit, :update]
  end
end
