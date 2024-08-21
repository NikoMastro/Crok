Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  patch 'task/:id/done', to: 'tasks#done', as: :task_done

  get 'landing', to: 'pages#landing', as: :landing


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

  get 'my_family', to: 'families#show', as: :family
  get 'dogs/:id/health', to: 'dogs#health', as: :dog_health
end
