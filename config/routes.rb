Rails.application.routes.draw do


  resources :searches
  resources :news
  resources :users
  
  # post 'find_user' => 'users#find'
  root 'home#index'
  get   '/auth' => 'auth#persist'
  post   '/login' => 'auth#login'

  post '/users/:user_id/searches' => 'searches#create'
  get '/users/:user_id/searches' => 'searches#index'
  get '/users/:user_id/searches/:id' => 'searches#show'
  post '/users/:user_id/news' => 'news#create'
  get '/users/:user_id/news' => 'news#index'
  get '/users/:user_id/news/:id' => 'news#show'
  get    '/users'          => 'users#index'
  post   '/signup'         => 'users#create'
  patch  '/user/:id'       => 'users#update'
  delete '/user/:id'       => 'users#destroy'
  delete '/searches/:id' =>'search#destroy'

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
