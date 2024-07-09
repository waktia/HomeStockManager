Rails.application.routes.draw do
  root "static_pages#home"

  get "/signup",   to: "users#new"
  get "/help",     to: "static_pages#help"
  get '/login',    to: "sessions#new"
  post "/login",   to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users do
    resources :main_categories, shallow: true
    resources :items,           shallow: true
  end
  resources :account_ativations, only: [:edit]
  resources :password_resets,    only: [:new, :create, :edit, :update]


  get "/items", to: "static_pages#home"
end
