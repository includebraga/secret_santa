Rails.application.routes.draw do
  namespace :admin do
    resources :users, :organizers, :receivers, :matches, :institutions

    post "/confirm/:id", to: "users#confirm", as: :users_confirmation
    post "/confirm/", to: "users#batch_confirm", as: :users_batch_confirmation
    post "/set_registrations", to: "users#set_registrations", as: :users_set_registrations
    post "/institution/:institution_id/import_receivers", to: "institutions#import_receivers", as: :institutions_import_receivers
    post "/match/:match_id/received", to: "matches#received", as: :match_received

    root "pages#index"
  end

  namespace :api, as: "API" do
    post "/slack", to: "slack#callback"
  end

  namespace :users do
    get "/confirm/:token", to: "confirmations#create", as: :confirmation
  end

  get "/sign_in", to: "sessions#new", as: :new_session
  get "/sign_in/google", to: "sessions#create", as: :new_google_session
  delete "/sign_out", to: "sessions#destroy", as: :delete_session

  root "home#index"

  resources :users, only: [:create]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
