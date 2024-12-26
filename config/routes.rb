Rails.application.routes.draw do
  # Public-facing routes
  root "home#index"
  resources :photos, only: [:index, :show]
  resources :projects, only: [:index]
  resources :posts, only: [:index, :show, :new, :create]

  # Admin-facing routes
  namespace :admin do
    resources :sessions, only: [:new, :create, :destroy]
    get '/login', to: 'sessions#new', as: :login
    post '/login', to: 'sessions#create' # Add this lines
    delete '/logout', to: 'sessions#destroy', as: :logout
    get '/logout', to: 'sessions#destroy', as: :logout_get
    get '/dashboard', to: 'dashboard#index', as: :dashboard
    get '/', to: 'dashboard#index' # Admin root redirects to dashboard
    resources :photos, only: [:index, :new, :create, :edit, :update, :destroy, :show]
    resources :projects, only: [:index, :new, :create, :edit, :update, :destroy, :show]
  end

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check
end
