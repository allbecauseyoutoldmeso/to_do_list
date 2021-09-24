Rails.application.routes.draw do
  root "lists#index"

  resources :lists, only: %i[index new create update] do
    get :archive, on: :collection
    resources :to_dos, only: %i[index create update]
  end

  resources :list_emails, only: %i[create]

  resources :archive_dones, only: %i[create]

  resources :sessions, only: %i[new create] do
    post :delete, on: :collection
  end
end
