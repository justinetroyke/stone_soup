class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

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

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy

    flash[:success] = "#{recipe.title} was successfully deleted!"
    redirect_to recipes_path
  end

private
  def recipe_params
    params.require(:recipe).permit(:title, :directions)
  end
end
