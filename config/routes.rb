# frozen_string_literal: true

Rails.application.routes.draw do
  resources :projects
  # in projects have:
  # get '/projects', controller: :projects,action: :index
  # get '/projects/:id', controller: :projects,action: :show
  # post '/projects', controller: :projects, action: :create
  resources :tasks
end
