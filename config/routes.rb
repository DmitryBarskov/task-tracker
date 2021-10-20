Rails.application.routes.draw do
  resources :projects
  resources :tasks

  get '/users', to: 'users#show'
  resource :users, only: %i[show new create]


  resources :sessions, only: %i[new create]
end
