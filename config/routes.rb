Rails.application.routes.draw do
  root "home#index"

  resources :users, only: [:create, :new]

  namespace :users do
    get "/confirm/:token", to: "confirmations#create", as: :confirmation
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
