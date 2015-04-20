Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :users, only: [:show, :edit, :update] do
    resources :bookings, only: [:index, :create, :new, :show]
    resources :flats, only: [:new, :create, :show, :edit, :update] do
      resources :pictures, only: [:create, :show]
    end
  end

end
