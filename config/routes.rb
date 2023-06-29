Rails.application.routes.draw do
  get 'recipe_foods/index'
   devise_for :users
   root "users#index"

  resources :users, only: [:index, :show]

  resources :foods, only: [:index, :show, :new, :create, :destroy] 

  resources :recipes, only:  [:index, :show, :new, :create, :destroy]do
    resources :recipe_foods, only: [:new, :create, :edit, :update,  :destroy]
  end

  resources :general_shopping_lists, only: [:index]

  get '/public_recipes', to: 'recipes#public', as: 'public_recipes'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
