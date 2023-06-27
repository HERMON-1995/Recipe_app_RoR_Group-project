class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def destroy
    @recipe = Recipe.includes(:user).find(params[:id])

    if @recipe.destroy
      flash[:notice] = 'Recipe was successfully deleted.'
      redirect_to recipes_path
    else
      flash[:error] = 'There was an error deleting the recipe.'
      redirect_to recipes_path
    end
  end
end
