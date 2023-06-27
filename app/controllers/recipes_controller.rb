class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def destroy
    @recipe = Recipe.includes(:user).find(params[:id])

    return unless @recipe.destroy

    flash[:notice] = 'Recipe was successfully deleted.'
    redirect_to recipes_path
  end
end
