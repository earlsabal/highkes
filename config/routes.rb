Rails.application.routes.draw do

  root 'pages#dashboard'

  devise_for :users
  resources :posts

  get '/dashboard' => 'pages#dashboard'
  get '/profile/:id' => 'pages#profile'
end
