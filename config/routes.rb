Rails.application.routes.draw do
  root 'users#index'
  devise_for :users
  resources :users
  resources :foods
  resources :general_shopping_list
  resources :recipes do
    resources :recipe_foods
  end

  resources :public_recipes
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
