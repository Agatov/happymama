Rails.application.routes.draw do

  root to: "application#index"

  get "/surprise", to: "application#surprise"

  resources :workshops, only: [:index, :show]
  resources :posts, only: [:index, :show]
  resources :contacts, only: :index
  resources :reviews, only: :index
  resources :orders, only: :create

  namespace :admin do

    root to: "groops#index"

    resources :workshops do
      resources :programs
    end

    resources :categories
    resources :teachers
    resources :groops
    resources :reviews
    resources :places
    resources :posts
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
