Rails.application.routes.draw do

  root 'posts#index'

  devise_for :users
  resources :posts do
  	resources :comments
  end

  
  get '/dashboard' => 'pages#dashboard'
  get '/profile/:id' => 'pages#profile'
end
