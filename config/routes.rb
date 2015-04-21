Rails.application.routes.draw do


  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  root to: "pages#home"

  resources :users, only: [:show] do
    resources :bookings, only: [:index, :create, :new, :show]
    resources :flats, only: [:new, :create, :show, :edit, :update] do
      resources :pictures, only: [:create, :show]
    end
  end

end
