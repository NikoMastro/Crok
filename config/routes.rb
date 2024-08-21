Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :dogs do
    resources :health_tracks, only: [:show, :new, :create, :edit, :update, :destroy]
    resources :medical_records
  end

  resources :tasks, only: [:create, :update]

  get 'my_family', to: 'families#show', as: :family
  get 'dogs/:dog_id/health', to: 'dogs#health', as: :dog_health
  get 'dogs/:dog_id/health/new', to: "health_tracks#new", as: :dog_health_new
  # get 'dogs/:dog_id/health/medical_records'
  # get 'dogs/:id/health/', to: "dogs#health", as: :health_tracks_path
end
