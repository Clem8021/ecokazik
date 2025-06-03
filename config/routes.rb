Rails.application.routes.draw do
  get "home/index"
  get "landing/index"
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
  get "instruments/index"
  get "instruments/show"
  get "pages/home"
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check
  root "landing#index"
  get "home", to: "home#index"
end
