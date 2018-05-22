class RecipeIngredientCreator
  def initialize(recipe_id:, recipe_ingredients:)
    recipe_ingredients[:recipe_id] = recipe_id
    RecipeIngredient.create!(recipe_ingredients)
  end
end
