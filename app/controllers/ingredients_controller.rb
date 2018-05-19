class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.create(ingredient_params)
    if params[:commit] == 'Save and Add More Ingredients'
      flash[:success] = "#{@ingredient.item} added!"

      redirect_to new_ingredient_path
    elsif params[:commit] == 'Create Ingredients'
      flash[:success] = "#{@ingredient.item} added!"

      redirect_to ingredients_path
    end
  end

private
  def ingredient_params
    params.require(:ingredient).permit(:item)
  end
end
