Rails.application.routes.draw do
  root "home#index"

  resources :users, only: [:create]
end
