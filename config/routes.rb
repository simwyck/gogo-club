Rails.application.routes.draw do

  root 'static_pages#home'

  get 'static_pages/home'

  get '/about', to:'static_pages#about'

  get '/contact', to:'static_pages#contact'

  resources :users

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end