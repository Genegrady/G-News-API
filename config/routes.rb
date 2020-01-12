Rails.application.routes.draw do


  resources :searches
  resources :news
  resources :users
  
  # post 'find_user' => 'users#find'
  root 'home#index'
  get   '/auth' => 'auth#persist'
  post   '/login' => 'auth#login'


  get    '/users'          => 'users#index'
  post   '/signup'         => 'users#create'
  patch  '/user/:id'       => 'users#update'
  delete '/user/:id'       => 'users#destroy'

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
