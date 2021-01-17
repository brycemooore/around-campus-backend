Rails.application.routes.draw do

  post '/login', to: 'authorization#create'
  post '/signup', to: 'users#create'
  get '/current_user', to: 'users#get_current_user'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
