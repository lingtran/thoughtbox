Rails.application.routes.draw do
  root "home#index"

  get '/signup', to: 'users#new', as: :signup
  resources :users, only: [:create]

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
