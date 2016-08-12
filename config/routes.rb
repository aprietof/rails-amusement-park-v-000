Rails.application.routes.draw do
  root 'pages#index'
  get '/signin' => 'sessions#new'
  resources :users, :sessions, :attractions
  post '/rides/create' => 'rides#create'

end
