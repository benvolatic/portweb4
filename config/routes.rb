Rails.application.routes.draw do
  
  # Public-facing routes
  root "home#index"
  get "/photos", to: "photos#index"
  get "/projects", to: "projects#index"
  resources :posts, only: [:index, :show, :new, :create]

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check
end
