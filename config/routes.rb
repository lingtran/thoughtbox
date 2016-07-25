Rails.application.routes.draw do
  root "home#index"

  get '/signup', to: 'users#new', as: :signup

  resources :users, only: [:create] do
    resources :links, only: [:index, :create]
  end

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :links, only: [:update]
    end
  end
end
