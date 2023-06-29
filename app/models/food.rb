class Food < ApplicationRecord
  belongs_to :user

  has_many :recipe_foods
  has_many :recipes, through: :recipe_foods, dependent: :destroy

  validates :name, presence: true
  validates :price, format: { with: /\A\$?\d+(\.\d{1,2})?\z/, message: 'must be a valid price format' }
end
