class Recipe < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :directions, presence: true
end