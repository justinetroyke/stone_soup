require 'rails_helper'

describe 'leader can add ingredients to recipe through' do
  before { login_as_leader }
  scenario 'leader adds ingredients to recipe and directs to index' do
    item = 'Onion'
    item2 = 'chicken'
    item3 = 'rice'
    item4 = 'cream of broccoli'
    amount = '1'
    amount2 = '12 oz'
    amount3 = '3 cups'
    amount4 = '2 cans'
    ingredient = Ingredient.create!(item: item)
    ingredient2 = Ingredient.create!(item: item2)
    ingredient3 = Ingredient.create!(item: item3)
    ingredient4 = Ingredient.create!(item: item4)
    title = 'Chicken Broccoli'
    directions = 'dump everything into pan, bake @ 350 degrees for 30 min'
    recipe = Recipe.create!(title: title, directions: directions)

    visit recipe_path(recipe)

    expect(page).to have_content recipe.title
    expect(page).to have_content recipe.directions

    fill_in 'recipe[recipe_ingredients][ingredient_amount]', with: amount
    select(ingredient.item, from: 'Ingredient')
    click_on 'Add'
    expect(page).to have_content(RecipeIngredient.last.ingredient_amount)

    fill_in 'recipe[recipe_ingredients][ingredient_amount]', with: amount2
    select(ingredient2.item, from: 'Ingredient')
    click_on 'Add'

    expect(page).to have_content(RecipeIngredient.last.ingredient_amount)

    fill_in 'recipe[recipe_ingredients][ingredient_amount]', with: amount3
    select(ingredient3.item, from: 'Ingredient')
    click_on 'Add'

    expect(page).to have_content(RecipeIngredient.last.ingredient_amount)

    fill_in 'recipe[recipe_ingredients][ingredient_amount]', with: amount4
    select(ingredient4.item, from: 'Ingredient')
    click_on 'Add'

    expect(current_path).to eq recipe_path(recipe)
    expect(page).to have_content ingredient.item
    expect(page).to have_content amount
    expect(page).to have_content ingredient2.item
    expect(page).to have_content amount2
    expect(page).to have_content ingredient3.item
    expect(page).to have_content amount3
    expect(page).to have_content ingredient4.item
    expect(page).to have_content amount4
  end
end
