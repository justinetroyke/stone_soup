require 'rails_helper'

describe 'leader can edit ingredients' do
  before { login_as_leader }

  scenario 'edits through button on index' do
    title = 'Chicken Broccoli'
    title_2 = 'Green Cluck'
    directions = 'dump everything into pan, bake @ 350 degrees for 30 min'
    directions_2 = 'do the thing'
    Recipe.create!(title: title, directions: directions)
    name = 'Justine Troyke'
    password = 'password '
    role = 1
    email = 'bringit@yo.com'

    visit recipes_path

    expect(page).to have_content(title)

    click_link 'Edit'
    fill_in 'recipe[title]', with: title_2
    fill_in 'recipe[directions]', with: directions_2
    click_button 'Create Recipe'

    expect(page).to have_content(title_2)
    expect(page).to have_content(directions_2)
  end

  scenario 'edits through button on show' do
    title = 'Chicken Broccoli'
    title_2 = 'Green Cluck'
    directions = 'dump everything into pan, bake @ 350 degrees for 30 min'
    directions_2 = 'do the thing'
    recipe = Recipe.create!(title: title, directions: directions)

    visit recipe_path(recipe)

    expect(page).to have_content(title)

    click_link 'Edit'

    fill_in 'recipe[title]', with: title_2
    fill_in 'recipe[directions]', with: directions_2
    click_button 'Create Recipe'

    expect(page).to have_content(title_2)
    expect(page).to have_content(directions_2)
  end
end
