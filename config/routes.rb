Rails.application.routes.draw do
  resources :ratings
  resources :posts
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # login route that can access in order to receive a token
  post :login, controller: 'application'
end
