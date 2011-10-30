Kcdata::Application.routes.draw do
  resources :relations

  get "users/show"

  resources :events
  get "/users/:name", :to => "users#show", :as => "user"

  delete "sessions", :to => "sessions#destroy", :as => "sign_out"

  match "/auth/:provider/callback", :to => "sessions#create"
  match "/auth/failure",            :to => "sessions#failure"

  root :to => "welcome#index"
end
