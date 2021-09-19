Rails.application.routes.draw do
  root "to_dos#index"

  resources :lists do
    resources :to_dos
  end

  resources :sessions, only: [:new, :create] do
    post :delete, on: :collection
  end
end
