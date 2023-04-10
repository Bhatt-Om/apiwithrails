Rails.application.routes.draw do
  use_doorkeeper do 
    skip_controllers :authorizations, :applications, :authorized_applications
  end
  
  root "posts#index"
  devise_for :users

  get "/posts" , to: "posts#index"
  post '/create_post', to: "posts#create"
  get '/posts/:id' , to: "posts#show"
  patch "/posts/:id", to: "posts#update"
  delete "/posts/:id" , to: "posts#destroy"
  # resources :users, only: %i[create]
  post '/sign_up', to: 'users#create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
