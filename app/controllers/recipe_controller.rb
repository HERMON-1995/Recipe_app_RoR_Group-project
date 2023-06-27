class RecipeController < ApplicationController
  def index
    @recipes = Recipe.all.includes(:user)
  end
end
