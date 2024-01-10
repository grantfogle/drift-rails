Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "flows#index"
  
  resources :flows
end


# https://guides.rubyonrails.org/v6.1/getting_started.html#creating-a-new-article
# authentication UserModel
# how to get live flows from website... scraping and getting once per day
## allow users to save favorites
## aller users to search by location
## currently at updating an article