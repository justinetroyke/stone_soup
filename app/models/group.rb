class Group < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :start, presence: true
  has_many :group_members
  has_many :members, through: :group_members, dependent: :destroy
  belongs_to :recipe

  def assign_ingredients
    ingreds = recipe.ingredients.shuffle.to_a
    members.each do |member|
      member.ingredient_id = ingreds.pop.id
      member.save!
    end
  end

  def get_assignments
    return unless members.all? { |m| m.ingredient_id }
    members.each_with_object({}) do |member, results|
      amount = RecipeIngredient.find_by(
        recipe_id: recipe.id,
        ingredient_id: member.ingredient_id
       ).ingredient_amount
      results[member.name] = [member.ingredient.item, amount]
    end
  end
end
