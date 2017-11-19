Rails.application.routes.draw do
  namespace :admin do
    resources :users

    root to: "users#index"
  end

  root "home#index"

  resources :users, only: [:create, :new]

  namespace :users do
    get "/confirm/:token", to: "confirmations#create", as: :confirmation
  end

  get '/.well-known/acme-challenge/:id' => 'pages#letsencrypt'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
