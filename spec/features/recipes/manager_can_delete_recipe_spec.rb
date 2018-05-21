require 'rails_helper'

describe 'manager can delete recipes' do
  scenario 'deletes through button on index' do
    title = 'Taco Salad'
    directions = 'grill chicken, put stuff in bowl, mix'
    recipe = Recipe.create!(title: title, directions: directions)

    visit recipes_path

    expect(page).to have_content(recipe.title)

    click_link 'Delete'

    expect(page).to have_no_content(recipe)
  end

  # scenario 'deletes through button on show' do
  #   title = 'Taco Salad'
  #   directions = 'grill chicken, put stuff in bowl, mix'
  #   recipe = Recipe.create!(title: title, directions: directions)
  #
  #   visit recipe_path(recipe)
  #
  #   expect(page).to have_content(recipe.directions)
  #   save_and_open_page
  #
  #   click_link 'Delete'
  #
  #   expect(current_path).to eq recipes_path
  # end
end
