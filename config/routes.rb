Rails.application.routes.draw do
  root "home#index"

  resources :users, only: [:create]

  namespace :users do
    get "/confirm/:token", to: "confirmations#create", as: :confirmation
  end
end
