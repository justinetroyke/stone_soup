# class RecipeIngredientsController < ApplicationController
#   def new
#     @recipe_ingredient = RecipeIngredient.new
#   end
#
#   def create
#     binding.pry
#     @recipe = Recipe.find(params[:recipe_id])
#     @ingredient = Ingredient.find(params[:ingredient_id])
#     @recipe_ingredient = @recipe.recipe_ingredients.create(recipe_ingredient_params)
#
#     redirect_to new_recipe_recipe_ingredient_path(@recipe)
#   end
#
# private
#   def recipe_ingredient_params
#     params.require(:recipe_ingredient)
#     .permit(
#       :ingredient_amount,
#       :ingredient_id,
#       :recipe_id
#     )
#   end
# end