Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: "registrations",
    sessions: "sessions"
  }

  root to: "pages#home"

  resources :users, only: [:show] do
    member do
      patch :remove_family
    end
  end
  patch 'task/:id/done', to: 'tasks#done', as: :task_done

  # General Pages
  get 'home', to: 'dogs#index', as: :home
  get 'features', to: 'pages#features', as: :features
  get 'welcome', to: 'families#welcome', as: :welcome

  resources :dogs do
    member do
      get 'health', to: 'dogs#health', as: :health
    end
    resources :health_tracks, except: [:index]
    resources :medical_records, only: [:index, :show, :new, :create]
  end

  resources :medical_records, only: [:edit, :update, :destroy]


  resources :tasks, only: [:create, :update, :destroy] do
    member do
      patch :toggle_status
    end
  end

  resources :comments, only: [:create]
  resources :families, only: [:show, :update]


end
