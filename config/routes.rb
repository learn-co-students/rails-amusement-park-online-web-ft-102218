Rails.application.routes.draw do
  root 'welcome#index'
  resources :users, only: [:index, :new, :show, :create, :edit]
  resources :attractions, only: [:index, :new, :show, :create, :edit, :update]
  get '/signin' => 'sessions#new'
  post '/sessions/create'
  post '/logout' => 'sessions#destroy'
  post '/rides/new'
end
