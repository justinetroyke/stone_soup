class Ingredient < ApplicationRecord
  validates :item, presence: true, uniqueness: true
  has_many :recipe_ingredients
  has_many :members
end
