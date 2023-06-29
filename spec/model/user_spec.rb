require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'is valid with a name' do
      user = User.new(name: 'User One', email: 'user@example.com', password: 'password')
      expect(user).to be_valid
    end

    it 'is invalid without a name' do
      user = User.new(name: nil, email: 'user@example.com', password: 'password')
      expect(user).to_not be_valid
    end
  end

  describe 'associations' do
    it 'has many foods' do
      user = User.new(name: 'User One', email: 'user@example.com', password: 'password')
      expect(user.foods).to be_empty
    end

    it 'has many recipes' do
      user = User.new(name: 'User One', email: 'user@example.com', password: 'password')
      expect(user.recipes).to be_empty
    end
  end

  describe 'devise modules' do
    it 'includes database_authenticatable module' do
      expect(User.devise_modules).to include(:database_authenticatable)
    end

    it 'includes registerable module' do
      expect(User.devise_modules).to include(:registerable)
    end

    it 'includes recoverable module' do
      expect(User.devise_modules).to include(:recoverable)
    end

    it 'includes rememberable module' do
      expect(User.devise_modules).to include(:rememberable)
    end

    it 'includes validatable module' do
      expect(User.devise_modules).to include(:validatable)
    end

    it 'includes confirmable module' do
      expect(User.devise_modules).to include(:confirmable)
    end
  end
end
