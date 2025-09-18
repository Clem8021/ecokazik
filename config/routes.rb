Rails.application.routes.draw do
  get "testimonials/index"
  # Pages statiques
  root "home#index"
  get "home", to: "home#index"

  # Devise (authentification)
  devise_for :users

  # Professeurs : partie publique
  resources :teachers, only: [:index, :show]

  # Admin : réservé aux admins
  namespace :admin do
    get "users/index"
    get "users/update"
    resources :teachers, only: [:index, :new, :create]
    resources :users, only: [:index, :update]
    # Tu peux ajouter ici d’autres ressources admin plus tard
  end

  # Dashboard et autres pages
  get "dashboard/show"
  get "badges/index"
  get "events/index"
  get "events/show"
  get "availabilities/index"
  get "availabilities/new"
  get "availabilities/create"
  get "availabilities/destroy"
  get "appointments/index"
  get "appointments/new"
  get "appointments/create"
  get "appointments/destroy"

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check
end
