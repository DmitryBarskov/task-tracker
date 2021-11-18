Rails.application.routes.draw do
  resources :projects
  resources :tasks do
    resources :comments, only: %i[new create edit update destroy]
  end
  get '/users', to: 'users#show'
  resources :users, only: %i[new create]

  resource :session, only: %i[new create destroy]
end
