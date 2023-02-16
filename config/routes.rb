# frozen_string_literal: true

Rails.application.routes.draw do
  get 'tests/main'
  get 'tests/edit'
  get 'tests/new'
  get 'sessions/exit'
  post 'sessions/create'
  root 'sessions#new'
  get 'calc/input'
  get 'calc/view'
  get 'users/index'
  get 'users/new'
  get 'users/xml'
  get 'tests/result'
  get '/tests/submit_test'
  resources :users
  resources :tests do
    post :answers
    get :submit_results
    get :results
    post :results
    post :all_results
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
