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

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    valid_recipe = @recipe.update(recipe_params)
    if params[:recipe][:recipe_ingredients].nil? && valid_recipe

      redirect_to recipe_path(@recipe)
    elsif valid_recipe
      RecipeIngredientCreator.new(recipe_id: params[:id], recipe_ingredients: recipe_ingredient_params)

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
    params.require(:recipe).require(:recipe_ingredients)
    .permit(
      :ingredient_amount,
      :ingredient_id
    )
  end
end
