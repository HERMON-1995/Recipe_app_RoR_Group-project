require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  before(:each) do
    @food = Food.create(name: 'Food One', price: '10.99')
    @recipe = Recipe.create(name: 'Recipe One', description: 'Recipe One Description')
    @recipe_food = RecipeFood.new(food: @food, recipe: @recipe, quantity: 2)
  end

  describe 'validations' do
    it 'is valid with a food, recipe, and quantity' do
      expect(@recipe_food).to be_valid
    end

    it 'is invalid without a quantity' do
      @recipe_food.quantity = nil
      expect(@recipe_food).to_not be_valid
    end
  end

  describe 'associations' do
    it 'belongs to a food' do
      expect(@recipe_food.food).to eq(@food)
    end

    it 'belongs to a recipe' do
      expect(@recipe_food.recipe).to eq(@recipe)
    end
  end
end
