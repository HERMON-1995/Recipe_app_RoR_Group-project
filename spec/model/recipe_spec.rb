require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:user) { User.create(name: 'Test User') }
  let(:recipe_one) { Recipe.create(name: 'Recipe One', description: 'Recipe One Description', user_id: user.id) }

  describe 'validations' do
    it 'is valid with a name and description' do
      expect(recipe_one).to be_valid
    end
  end
end
