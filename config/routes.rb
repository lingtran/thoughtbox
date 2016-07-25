Rails.application.routes.draw do
  root "home#index"

  get '/signup', to: 'users#new', as: :signup

  resources :users, only: [:create] do
    resources :links, only: [:index, :create, :update, :destroy]
  end

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
