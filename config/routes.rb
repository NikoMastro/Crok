Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :dogs do
    resources :health_tracks, only: [:new, :create, :update, :destroy]
    resources :medical_records, only: [:new, :create, :update, :destroy]
  end

  resources :tasks, only: [:create, :update]

  get 'my_family', to: 'families#show', as: :family
  get 'dogs/:id/health', to: 'dogs#health', as: :dog_health
end
