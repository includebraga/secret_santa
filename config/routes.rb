Rails.application.routes.draw do
  namespace :admin do
    resources :users, :receivers, :matches, :institutions

    root "pages#index"
  end

  root "home#index"

  resources :users, only: [:create, :new]

  namespace :api, as: "API" do
    post "/slack", to: "slack#callback"
  end

  namespace :users do
    get "/confirm/:token", to: "confirmations#create", as: :confirmation
  end

  namespace :admin do
    post "/confirm/:id", to: "users#confirm", as: :users_confirmation
    post "/confirm/", to: "users#batch_confirm", as: :users_batch_confirmation
    post "/assign/:id", to: "users#assign", as: :users_assign
    post "/assign", to: "users#batch_assign", as: :users_batch_assign
    post "/set_registrations", to: "users#set_registrations", as: :users_set_registrations
    post "/match/:id", to: "users#match", as: :users_match
    post "/match/", to: "users#batch_match", as: :users_batch_match
    post "/receive/:id", to: "users#receive", as: :users_receive
    post "/revert/:id", to: "users#revert_receive", as: :users_revert
    post "/institution/:institution_id/import_receivers", to: "institutions#import_receivers", as: :institutions_import_receivers
    post "/match/:match_id/received", to: "matches#received", as: :match_received
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
