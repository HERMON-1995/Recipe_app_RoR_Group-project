Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:index, :show] do
    resources :foods, only: [:index, :show, :new, :create, :destroy] do
      resources :recipefoods, only: [:create]
    end
    resources :recipes, only: [:create, :new, :destroy, :index]do
      resources :recipefoods, only: [:create]
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # root "home#index"
end
