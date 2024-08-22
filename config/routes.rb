Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: "pages#home"
  resources :users, only: [:show]
  patch 'task/:id/done', to: 'tasks#done', as: :task_done

  get 'landing', to: 'pages#landing', as: :landing
  get 'features', to: 'pages#features', as: :features



  resources :dogs do
    resources :health_tracks, only: [:show, :new, :create, :edit, :update, :destroy]
    resources :medical_records
  end

  resources :tasks, only: [:create, :update] do
    member do
      patch :toggle_status
      patch :assign_user
    end
  end

  resources :comments, only: [:create]
  resources :families, only: [:update, :create]

  get 'welcome', to: 'dogs#welcome', as: :welcome
  get 'dogs/:dog_id/health', to: 'dogs#health', as: :dog_health
  get 'dogs/:dog_id/health/new', to: "health_tracks#new", as: :dog_health_new
  # get 'dogs/:dog_id/health/medical_records'
  # get 'dogs/:id/health/', to: "dogs#health", as: :health_tracks_path
end
