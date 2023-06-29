class RecipesController < ApplicationController
  def index
    @user = current_user
    @recipes = Recipe.includes(:user).where(user_id: current_user.id)
  end

  def public
    @recipes = Recipe.includes(:user, :foods).where(public: true).order(created_at: :desc)
  end

  def show
    @recipe = Recipe.includes(:user).find_by(id: params[:id])
    @recipe_foods = RecipeFood.includes(:recipe).where(recipe_id: @recipe.id)
  end

  def new
    @recipe = Recipe.includes(:user).new
  end

  def create
    @recipe = Recipe.create(recipe_params.merge(user_id: current_user.id))

    if @recipe.save
      redirect_to recipes_path, notice: 'New recipe was successfully created.'
    else
      render :new, alert: 'Error creating new recipe.'
    end
  end

  def destroy
    @recipe = Recipe.find_by(id: params[:id])

    return unless @recipe.destroy

    flash[:notice] = 'Recipe was successfully deleted.'
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :preparation_time, :cooking_time, :public)
  end
end
