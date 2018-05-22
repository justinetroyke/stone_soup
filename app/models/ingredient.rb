class Ingredient < ApplicationRecord
  validates :item, presence: true, uniqueness: true
  has_many :recipe_ingredients
end
