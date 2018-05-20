class Ingredient < ApplicationRecord
  validates :item, presence: true, uniqueness: true
end
