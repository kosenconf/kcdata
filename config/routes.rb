Kcdata::Application.routes.draw do
  resources :events

  root :to => "welcome#index"
end
