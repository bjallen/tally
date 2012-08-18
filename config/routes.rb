Tally::Application.routes.draw do
  mount Doorkeeper::Engine => '/oauth'

  resources :items

  devise_for :users

  root :to => "items#index"

end
