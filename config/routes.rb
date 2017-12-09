Rails.application.routes.draw do
  namespace :admin do
    resources :users, :receivers, :matches, :institutions

    root to: "users#index"
  end

  root "home#index"

  resources :users, only: [:create, :new]

  namespace :users do
    get "/confirm/:token", to: "confirmations#create", as: :confirmation
  end

  namespace :admin do
    post "/confirm/:id", to: "users#confirm", as: :users_confirmation
    post "/confirm/", to: "users#batch_confirm", as: :users_batch_confirmation
    post "/assign", to: "users#batch_assign", as: :users_batch_assign
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
