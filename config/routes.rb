Rails.application.routes.draw do
  # Public-facing routes
  root "home#index"
  get "/photos", to: "photos#index"
  get "/projects", to: "projects#index"
  resources :posts, only: [:index, :show, :new, :create]

  # Admin-facing routes
  namespace :admin do
    get '/', to: 'dashboard#index', as: :dashboard
    resources :photos, only: [:index, :new, :create, :edit, :update, :destroy, :show]
    resources :projects, only: [:index, :new, :create, :edit, :update, :destroy, :show]
  end

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check
end
