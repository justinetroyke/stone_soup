class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)
    if @recipe.save
      flash[:success] = "#{@recipe.title} added!"

      redirect_to recipes_path
    else
      flash[:error] = "Please complete all fields"

      redirect_to new_recipe_path
    end
  end

private
  def recipe_params
    params.require(:recipe).permit(:title, :directions)
  end
end
