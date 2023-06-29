class Recipe < ApplicationRecord
  belongs_to :user

  has_many :recipe_foods
  has_many :foods, through: :recipe_foods, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true
end
