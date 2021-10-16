Rails.application.routes.draw do
  root "lists#index"

  resources :activate_lists, only: %i[update]
  resources :archive_dones, only: %i[update]
  resources :archive_lists, only: %i[update]

  resources :lists, only: %i[index new create update] do
    get :archive, on: :collection
    resources :archive_scheduled, only: %i[update]
    resources :convert_from_scheduled, only: %i[update]
    resources :convert_to_scheduled, only: %i[update]
    resources :scheduled_to_dos, only: %i[index create]
    resources :to_dos, only: %i[index create show update]
    resources :update_states, only: %i[update]
    resources :update_tasks, only: %i[update]
  end

  resources :list_emails, only: %i[update]
  resources :rename_lists, only: %i[update]

  resources :sessions, only: %i[new create] do
    post :delete, on: :collection
  end
end
