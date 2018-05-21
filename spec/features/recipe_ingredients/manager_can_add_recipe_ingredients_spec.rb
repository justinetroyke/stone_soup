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
    directions = 'dump everything into pan, bake @ 350 degrees for 30 min'
    heading = 'Recipes'

    visit new_recipe_path

    fill_in 'recipe[title]', with: title
    fill_in 'recipe[amount_1]', with: amount_1
    fill_in 'recipe[ingredient_1]', with: ingredient
    fill_in 'recipe[amount_1]', with: amount_2
    fill_in 'recipe[ingredient_2]', with: ingredient_2
    fill_in 'recipe[amount_1]', with: amount_3
    fill_in 'recipe[ingredient_3]', with: ingredient_3
    fill_in 'recipe[amount_1]', with: amount_4
    fill_in 'recipe[ingredient_4]', with: ingredient_4
    fill_in 'recipe[directions]', with: directions
    click_button 'Create Recipe'

    expect(current_path).to eq recipes_path
    expect(page).to have_link title
    expect(page).to have_content heading
    expect(page).to have_content ingredient
    expect(page).to have_content amount_1
    expect(page).to have_content ingredient_2
    expect(page).to have_content amount_2
    expect(page).to have_content ingredient_3
    expect(page).to have_content amount_3
    expect(page).to have_content ingredient_4
    expect(page).to have_content amount_4
  end
end
