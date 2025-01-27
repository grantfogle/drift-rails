Rails.application.routes.draw do
  resource :example, constraints: -> { Rails.env.development? }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'streams#index'

  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'

  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  
  delete 'logout', to: 'sessions#destroy'

  get 'maps', to: 'maps#show'

  get 'streams', to: 'streams#index'
end


# https://guides.rubyonrails.org/v6.1/getting_started.html#creating-a-new-article
# authentication UserModel
# how to get live flows from website... scraping and getting once per day
## allow users to save favorites
## allow users to search by location
## currently at updating an article