class RecipesController < ApplicationController
  def index
    @user = current_user
    @recipes = Recipe.includes(:user).where(user_id: current_user.id)
  end

  def destroy
    @recipe = Recipe.find_by(id: params[:id])

    return unless @recipe.destroy

    flash[:notice] = 'Recipe was successfully deleted.'
    redirect_to recipes_path
  end
end
