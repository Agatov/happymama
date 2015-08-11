Rails.application.routes.draw do

  namespace :admin do
    resources :workshops do
      resources :programs
    end
    resources :categories
    resources :teachers
    resources :groops
    resources :reviews
  end
end
