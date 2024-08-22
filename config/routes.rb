Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  patch 'task/:id/done', to: 'tasks#done', as: :task_done

  get 'landing', to: 'pages#landing', as: :landing


  resources :dogs do
    resources :health_tracks, only: [:show, :edit, :update, :new, :create, :destroy]
    resources :medical_records, only: [:index, :show, :new, :create]
  end

  resources :medical_records, only: [:edit, :update, :destroy]

  resources :tasks, only: [:create, :update] do
    member do
      patch :toggle_status
      patch :assign_user
    end
  end

  resources :comments, only: [:create]

  get 'my_family', to: 'families#show', as: :family
  get 'dogs/:id/health', to: 'dogs#health', as: :dog_health
  get 'dogs/:dog_id/health', to: 'dogs#health', as: :dog_id_health
  get 'dogs/:id/health/new', to: "health_tracks#new", as: :dog_health_new

end
