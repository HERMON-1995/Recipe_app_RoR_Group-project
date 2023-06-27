class RecipesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @recipes = Recipe.includes(:user).where(user_id: @user.id)
  end

  def destroy
    @recipe = Recipe.find_by(id: params[:id])

    return unless @recipe.destroy

    flash[:notice] = 'Recipe was successfully deleted.'
    redirect_to user_recipes_path(user_id: params[:user_id])
  end
end
