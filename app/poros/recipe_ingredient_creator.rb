class RecipeIngredientCreator
  def initialize(recipe_id, recipe_ingredient_params)
    recipe_ingredient_params[:recipe_id] = recipe_id
    RecipeIngredient.create!(recipe_ingredient_params)
  end
end
