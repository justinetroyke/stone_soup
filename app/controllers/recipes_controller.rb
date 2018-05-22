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
class RecipeIngedient
  def create
    @recipe = Recipe.create(recipe_params)
    if @recipe.save
      RecipeIngredientCreator.new(recipe_ingredient_params)
      flash[:success] = "#{@recipe.title} added!"

      redirect_to recipes_path
    else
      flash[:error] = "Please complete all fields"

      redirect_to new_recipe_path
    end
  end
end
  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)

      redirect_to recipe_path(@recipe)
    else
      render 'Edit'
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

  def recipe_ingredient_params
    params.require(:recipe_ingredient)
    .permit(
      :ingredient_amount,
      :ingredient_id,
      :recipe_id
    )
  end
end
