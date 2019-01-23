Rails.application.routes.draw do
  root 'users#new'
  get '/signin', to: 'sessions#new'
  post '/ride', to: 'rides#ride'
  delete '/logout', to: 'sessions#destroy'
  
  resources :sessions, only: [:create, :destroy]
  resources :users
  resources :attractions

end
