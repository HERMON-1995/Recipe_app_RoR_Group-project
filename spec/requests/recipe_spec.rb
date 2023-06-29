require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  include Devise::Test::IntegrationHelpers

  before(:each) do
    @user = User.create(name: 'User one', email: 'user@example.com', password: 'password', confirmation_token: '23moe234f',
                        confirmed_at: Time.now, confirmation_sent_at: Time.now)
    @recipe_one = @user.recipes.create(name: 'Recipe One', description: 'Recipe One Description')

    sign_in @user # Authenticate the user
  end

  describe 'GET /index' do
    before(:each) do
      get recipes_path
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'get correct response status' do
      assert_equal 'index', @controller.action_name
    end

    it 'renders an index template' do
      assert_template :index
    end

    it 'has a correct respsonse body for the existed users' do
      assert_match 'Here is the recipe list', @response.body
    end
  end

  describe 'GET /public_recipe' do
    before(:each) do
      get public_recipes_path
    end

    it 'renders a successfull response' do
      expect(response).to be_successful
    end

    it 'get correct response status' do
      expect(response).to have_http_status(200)
    end

    it 'direct to correct controller action' do
      assert_equal 'public', @controller.action_name
    end

    it 'render a show template' do
      assert_template 'recipes/public'
    end

    it 'has a correct header name' do
      assert_match 'Here is the public recipe list', @response.body
    end
  end

  describe 'GET /show' do
    before(:each) do
      get recipe_path(@recipe_one)
    end

    it 'renders a successfull response' do
      expect(response).to be_successful
    end

    it 'get correct response status' do
      expect(response).to have_http_status(200)
    end

    it 'direct to correct controller action' do
      assert_equal 'show', @controller.action_name
    end

    it 'render a show template' do
      assert_template :show
    end

    it 'has a correct header name' do
      assert_match 'Recipe One', @response.body
    end

    it 'has a correct description' do
      assert_match @recipe_one.description, @response.body
    end
  end
end
