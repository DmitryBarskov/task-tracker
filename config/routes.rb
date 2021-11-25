Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  resources :projects
  resources :tasks do
    resources :comments, only: %i[create edit update]
  end

  get '/users', to: 'users#show'
  resources :users, only: %i[new create]

  resource :session, only: %i[new create destroy]
end
