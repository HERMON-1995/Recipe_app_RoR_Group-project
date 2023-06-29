class GeneralShoppingListsController < ApplicationController
  before_action :authenticate_user!

  def index
    recipes = current_user.recipes.includes(recipe_foods: :food)
    shoppinglist_raw = {}
    @shoppinglist = []

    recipes.each do |recipe|
      recipe.recipe_foods.each do |recipefood|
        food = recipefood.food
        if shoppinglist_raw[food.id]
          shoppinglist_raw[food.id][:quantity] += recipefood.quantity
        else
          shoppinglist_raw[food.id] = {
            food:,
            quantity: recipefood.quantity
          }
        end
      end

      update_shoppinglist(shoppinglist_raw)
    end
  end

  private

  def update_shoppinglist(shoppinglist_raw)
    shoppinglist_raw.values.each do |recipefood|
      quantity = recipefood[:quantity] - recipefood[:food].quantity
      next unless quantity.positive?

      @shoppinglist << {
        food: recipefood[:food],
        quantity:,
        price: recipefood[:food].price * quantity
      }
    end
  end
end
