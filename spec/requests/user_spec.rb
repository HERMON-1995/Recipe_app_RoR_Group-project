require 'rails_helper'

RSpec.describe 'Users', type: :request do
  include Devise::Test::IntegrationHelpers

  before(:each) do
    @user = User.create(name: 'User One', email: 'user@example.com', password: 'password', confirmation_token: '23moe234f',
                        confirmed_at: Time.now, confirmation_sent_at: Time.now)

    sign_in @user # Authenticate the user
  end

  describe 'GET /index' do
    before(:each) do
      get users_path
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders an index template' do
      expect(response).to render_template(:index)
    end

    it 'displays the user name' do
      expect(response.body).to include(@user.name)
    end
  end
end
