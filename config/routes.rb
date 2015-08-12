Rails.application.routes.draw do

  root to: "application#index"

  resources :workshops, only: [:index, :show]
  resources :contacts, only: :index
  resources :reviews, only: :index
  resources :orders, only: :create

  namespace :admin do
    resources :workshops do
      resources :programs
    end
    resources :categories
    resources :teachers
    resources :groops
    resources :reviews
    resources :places
  end
end
