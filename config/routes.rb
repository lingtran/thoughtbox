Rails.application.routes.draw do
  root "home#index"

  get '/signup', to: 'users#new', as: :signup

  resources :users, only: [:create] do
    resources :links, only: [:index, :create, :edit, :update]
  end

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get '/users/:user_id/links', to: 'links#index'
      patch '/users/:user_id/links/:link_id', to: 'links#update'
    end
  end
end
