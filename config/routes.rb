Rails.application.routes.draw do
  root "home#index"

  get "/login", to: "sessions#new"
end
