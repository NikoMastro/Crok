Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: "registrations",
    sessions: "sessions"
  }

  root to: "pages#landing"

  resources :users, only: [:show] do
    member do
      patch :remove_family
    end
  end
  patch 'task/:id/done', to: 'tasks#done', as: :task_done

  get 'home', to: 'pages#home', as: :home
  get 'features', to: 'pages#features', as: :features

  resources :dogs do
    resources :health_tracks, only: [:show, :edit, :update, :new, :create, :destroy]
    resources :medical_records, only: [:index, :show, :new, :create]
  end

  resources :medical_records, only: [:edit, :update, :destroy, :show]

  resources :tasks, only: [:create, :update, :destroy] do
    member do
      patch :toggle_status
    end
  end

  resources :comments, only: [:create]
  resources :families, only: [:show, :update]

  get 'welcome', to: 'families#welcome', as: :welcome
  get 'dogs/:id/health', to: 'dogs#health', as: :dog_health
  get 'dogs/:dog_id/health', to: 'dogs#health', as: :dog_id_health
  get 'dogs/:id/health/new', to: "health_tracks#new", as: :dog_health_new
end
