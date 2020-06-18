Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'users#home'

  get '/login/' , to: 'users#login', as: 'login'
  delete '/logout', to: 'users#logout', as: 'logout'
  get '/find_user/' , to: 'users#find_user', as: 'find_user'
  post 'books/:id', to: 'books#favorite', as: 'favorite'
  post 'rhymes/:id', to: 'rhymes#favorite'
  

  resources :users
  resources :books, only: [:show, :index]
  resources :rhymes, only: [:show, :index] 

end
