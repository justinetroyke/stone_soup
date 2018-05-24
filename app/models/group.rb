class Group < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :start, presence: true
  has_many :group_members
  has_many :members, through: :group_members
  belongs_to :recipe

  def assign_ingredients
    members.shuffle
    recipe.ingredients.shuffle
    ing = recipe.ingredients.to_a
    members.each do |member|
      member.ingredient_id = ing.pop.id
      member.save!
    end
  end

  def get_assignments
    results = {}
    members.each do |member|
      ing_id = member.ingredient_id
      amount = RecipeIngredient.find_by(recipe_id: recipe.id, ingredient_id: member.ingredient_id).ingredient_amount
      results[member.name] = [member.ingredient.item, amount]
    end
    results
  end
end
