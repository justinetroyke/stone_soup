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
end
