class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.create(ingredient_params)
    if params[:commit] == 'Save and Add More Ingredients' && @ingredient.save
      flash[:success] = "#{@ingredient.item} added!"

      redirect_to new_ingredient_path
    elsif params[:commit] == 'Create Ingredient' && @ingredient.save
      flash[:success] = "#{@ingredient.item} added!"

      redirect_to ingredients_path
    else
      flash[:error] = "Really!? there is only one field to complete... try again!"

      redirect_to new_ingredient_path
    end
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.update(ingredient_params)
      redirect_to ingredients_path
    else
      render 'Edit'
    end
  end

  def destroy
    ingredient = Ingredient.find(params[:id])
    ingredient.destroy

    flash[:success] = "#{ingredient.item} was successfully deleted!"
    redirect_to ingredients_path
  end

private
  def ingredient_params
    params.require(:ingredient).permit(:item)
  end
end
