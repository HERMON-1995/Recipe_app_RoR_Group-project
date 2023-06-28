Rails.application.routes.draw do
   devise_for :users
   root "users#index"

  resources :users, only: [:index, :show] do 
  end

  resources :foods, only: [:index, :show, :new, :create, :destroy] 

  resources :recipes, only:  [:index, :show, :new, :create, :destroy]do
    resources :recipefoods, only: [:create]
  end

  get '/public_recipes', to: 'recipes#public', as: 'public_recipes'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
