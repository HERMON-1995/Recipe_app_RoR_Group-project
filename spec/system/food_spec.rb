require 'rails_helper'

RSpec.describe 'Foods', type: :system do
  include Devise::Test::IntegrationHelpers

  before(:each) do
    @user = User.create(name: 'User one', email: 'user@example.com', password: 'password', confirmation_token: '23moe234f',
                        confirmed_at: Time.now, confirmation_sent_at: Time.now)
    @food_one = @user.foods.create(name: 'Food One', price: '$10.99')

    sign_in @user # Authenticate the user
  end

  describe 'User visits the foods index page' do
    before(:each) do
      visit foods_path
    end

    scenario 'I can see a food name' do
      assert_text @food_one.name
    end
  end

  describe 'User visits the food page' do
    before(:each) do
      visit foods_path
    end

    scenario 'I can see a food name' do
      assert_text @food_one.name
    end

    scenario 'I can see the price' do
      assert_text @food_one.price
    end

    scenario 'When I click on Add food, it redirects me to the foods index page' do
      click_link 'Add food'
      assert_current_path new_food_path
    end
  end
end
