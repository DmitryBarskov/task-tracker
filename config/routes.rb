Rails.application.routes.draw do
  devise_for :users
  resources :projects
  resources :tasks

  root 'home#index'
end
