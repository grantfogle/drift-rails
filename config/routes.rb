Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "flows#index"
  get "/flows", to: "flows#index"
  get "/flows/:id", to: "flows#show"
end
