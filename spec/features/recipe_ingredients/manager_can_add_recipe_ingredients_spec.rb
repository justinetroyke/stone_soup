require 'rails_helper'

describe 'manager can add ingredients to recipe through' do
  scenario 'manager adds ingredients to recipe and directs to index' do
    item = 'Onion'
    item2 = 'chicken'
    item3 = 'rice'
    item4 = 'cream of broccoli'
    amount = '1'
    amount_2 = '12 oz'
    amount_3 = '3 cups'
    amount_4 = '2 cans'
    ingredient = Ingredient.create!(item: item)
    ingredient_2 = Ingredient.create!(item: item2)
    ingredient_3 = Ingredient.create!(item: item3)
    ingredient_4 = Ingredient.create!(item: item4)
    title = 'Chicken Broccoli'
    select_box = 'Ingredient'
    directions = 'dump everything into pan, bake @ 350 degrees for 30 min'
    recipe = Recipe.create!(title: title, directions: directions)

    visit recipe_path(recipe)

    expect(page).to have_content recipe.title
    expect(page).to have_content recipe.directions

    fill_in 'recipe[recipe_ingredients][ingredient_amount]', with: amount
    select(ingredient.item, from: 'Ingredient')
    click_on 'Add'
    expect(page).to have_content(RecipeIngredient.last.ingredient_amount)

    fill_in 'recipe[recipe_ingredients][ingredient_amount]', with: amount_2
    select(ingredient_2.item, from: 'Ingredient')
    click_on 'Add'

    expect(page).to have_content(RecipeIngredient.last.ingredient_amount)

    fill_in 'recipe[recipe_ingredients][ingredient_amount]', with: amount_3
    select(ingredient_3.item, from: 'Ingredient')
    click_on 'Add'

    expect(page).to have_content(RecipeIngredient.last.ingredient_amount)

    fill_in 'recipe[recipe_ingredients][ingredient_amount]', with: amount_4
    select(ingredient_4.item, from: 'Ingredient')
    click_on 'Add'

    expect(current_path).to eq recipe_path(recipe)
    expect(page).to have_content ingredient.item
    expect(page).to have_content amount
    expect(page).to have_content ingredient_2.item
    expect(page).to have_content amount_2
    expect(page).to have_content ingredient_3.item
    expect(page).to have_content amount_3
    expect(page).to have_content ingredient_4.item
    expect(page).to have_content amount_4
  end
end
