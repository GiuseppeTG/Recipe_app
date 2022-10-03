Rails.application.routes.draw do
  resources :foods
  resources :recipes
  devise_for :users
  root 'users#index'
  resources :users
  resources :recipes
  resources :public_recipes
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
