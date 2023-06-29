require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  include Devise::Test::IntegrationHelpers

  before(:each) do
    @user = User.create(name: 'User one', email: 'user@example.com', password: 'password', confirmation_token: '23moe234f',
                        confirmed_at: Time.now, confirmation_sent_at: Time.now)
    @food_one = @user.foods.create(name: 'Food One', price: '10.99')

    sign_in @user # Authenticate the user
  end

  describe 'GET /index' do
    before(:each) do
      get foods_path
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'get correct response status' do
      expect(response).to have_http_status(200)
    end

    it 'renders an index template' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /new' do
    before(:each) do
      get new_food_path
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'get correct response status' do
      expect(response).to have_http_status(200)
    end

    it 'renders a new template' do
      expect(response).to render_template(:new)
    end

    it 'has a correct header name' do
      expect(response.body).to include('Add a new food')
    end
  end
end
