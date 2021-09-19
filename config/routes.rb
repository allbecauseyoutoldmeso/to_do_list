Rails.application.routes.draw do
  root "to_dos#index"
  resources :to_dos
  resources :sessions, only: [:new, :create] do
    post :delete, on: :collection
  end
end
