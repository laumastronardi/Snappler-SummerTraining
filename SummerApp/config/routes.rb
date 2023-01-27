Rails.application.routes.draw do
  resources :users do
    post 'follow', to: 'users#toggle_follow'
  end

  patch 'lang', to: 'application#change_lang'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root 'users#index'

  namespace :api do
    get 'users', to: 'users_api#index'
    post 'users', to: 'users_api#create'
    get 'users/:id', to: 'users_api#show'
    put 'users/:id', to: 'users_api#update'
    delete 'users/:id', to: 'users_api#destroy'
  end
end