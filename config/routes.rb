Rails.application.routes.draw do
  namespace :admin do
    resources :users, :receivers, :matches, :institutions

    root to: "users#index"
  end

  root "home#index"

  resources :users, only: [:create, :new]
  get "/redeem/:token", to: "matches#new", as: :match_preview
  post "/redeem/:token", to: "matches#create", as: :match

  namespace :users do
    get "/confirm/:token", to: "confirmations#create", as: :confirmation
  end

  namespace :admin do
    post "/confirm/:id", to: "users#confirm", as: :users_confirmation
    post "/confirm/", to: "users#batch_confirm", as: :users_batch_confirmation
    post "/assign", to: "users#batch_assign", as: :users_batch_assign
    post "/match/:id", to: "users#match", as: :users_match
    post "/match/", to: "users#batch_match", as: :users_batch_match
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
