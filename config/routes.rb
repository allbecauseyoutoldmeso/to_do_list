Rails.application.routes.draw do
  root "lists#index"

  resources :lists, only: %i[index new create update] do
    get :archive, on: :collection
    patch :email
    resources :to_dos, only: %i[index create update]
  end

  resources :sessions, only: %i[new create] do
    post :delete, on: :collection
  end
end
