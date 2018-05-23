class Group < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :start, presence: true
  has_many :group_members
  has_many :members, through: :group_members
  belongs_to :recipe

  def self.assign_ingredients!(members:, ingredients:)
    members.shuffle
    ingredients = ingredients.shuffle.to_a
    members.each do |member|
      member.ingredient_id = ingredients.pop.id
      member.save!
    end
  end

  def get_assignments
    {username: [ingredient_name, quantity]}
  end
end
