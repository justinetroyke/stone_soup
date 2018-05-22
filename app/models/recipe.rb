class Recipe < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :directions, presence: true
  has_many :recipe_ingredients
  has_many :groups
end
