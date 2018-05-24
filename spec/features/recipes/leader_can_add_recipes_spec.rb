require 'rails_helper'

describe 'leader can add recipes through /recipes/new' do
  before { login_as_leader }
  scenario 'sees new recipes form' do
    button = 'Create Recipe'
    visit new_recipe_path

    expect(page).to have_button(button)
    expect(page).to have_field('recipe[title]')
  end

  scenario 'leader adds new recipe and directs to index' do
    title = 'Chicken Broccoli'
    directions = 'dump everything into pan, bake @ 350 degrees for 30 min'
    heading = 'Recipes'

    visit new_recipe_path

    fill_in 'recipe[title]', with: title
    fill_in 'recipe[directions]', with: directions
    click_button 'Create Recipe'

    expect(current_path).to eq recipes_path
    expect(page).to have_link title
    expect(page).to have_content heading
  end

  scenario 'leader clicks on recipe link and directs to show' do
    title = 'Chicken Broccoli'
    title2 = 'Taco Salad'
    directions = 'dump everything into pan, bake @ 350 degrees for 30 min'
    directions2 = 'grill chicken, put stuff in bowl, mix'
    Recipe.create!(title: title, directions: directions)
    recipe2 = Recipe.create!(title: title2, directions: directions2)

    visit recipes_path

    click_link title2

    expect(current_path).to eq recipe_path(recipe2)
    expect(page).to have_content directions2
    expect(page).to have_content "#{title2} Recipe"
  end
end
