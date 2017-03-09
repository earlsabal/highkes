Rails.application.routes.draw do

  root 'posts#index'

  devise_for :users
  resources :messages
  resources :posts do
  	resources :comments
  end
  
  get '/dashboard' => 'pages#dashboard'
  get '/profile/:id' => 'pages#profile'
  get '/your_likes' => 'pages#your_likes'
  get '/posts/:id/likes' => 'posts#likes'
  
  match 'like', to: 'likes#like', via: :post
  match 'unlike', to: 'likes#unlike', via: :delete
end
