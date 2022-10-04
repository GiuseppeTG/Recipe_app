Rails.application.routes.draw do
  resources :foods
  resources :general_shopping_list
  resources :recipes do
    resources :recipe_foods
  end
  devise_for :users
  root 'users#index'
  resources :users

  resources :public_recipes
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
