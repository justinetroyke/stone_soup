class Group < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :start, presence: true
  has_many :group_members
  belongs_to :recipe

  # def self.assign_ingredients
  # end
end
