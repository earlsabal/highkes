Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users
  resources :posts do
  	resources :comments
  end
  
  get '/dashboard' => 'pages#dashboard'
  get '/profile/:id' => 'pages#profile'
  get '/your_likes' => 'pages#your_likes'
  
  match 'heart', to: 'hearts#heart', via: :post
  match 'unheart', to: 'hearts#unheart', via: :delete
end
