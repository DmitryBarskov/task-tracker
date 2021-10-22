Rails.application.routes.draw do
  resources :projects
  resources :tasks

  get '/users', to: 'users#show'
  resources :users, only: %i[new create]

  resources :sessions, only: %i[new create]
end
