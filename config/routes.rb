# config/routes.rb
Rails.application.routes.draw do
  devise_for :users
  root "pages#welcome"

  get "about", to: "pages#about"
  get "services", to: "pages#services"

  # Public routes
  resources :events, only: [:index, :show]
  resources :products, only: [:index, :show]

  # Admin routes
  namespace :admin do
    root to: "dashboard#index"
    resources :events
    resources :products
    resources :page_contents, only: [:index, :edit, :update]
  end
end
