require 'rails_helper'

describe 'leader can edit groups' do
  before do
    login_as_leader
  end
  scenario 'edits through button on index' do
    title = 'Chicken Broccoli'
    directions = 'dump everything into pan, bake @ 350 degrees for 30 min'
    recipe = Recipe.create!(title: title, directions: directions)
    title = 'Soupers'
    title2 = 'Hungry Men'
    start = '2018-05-28'
    Group.create!(title: title, start: start, recipe_id: recipe.id)

    visit groups_path

    expect(page).to have_content(title)

    click_link 'Edit'
    fill_in 'group[title]', with: title2
    click_button 'Create Group'

    expect(page).to have_content(title2)
    expect(page).to have_content(start)
  end

  scenario 'edits through button on show' do
    title = 'Chicken Broccoli'
    directions = 'dump everything into pan, bake @ 350 degrees for 30 min'
    recipe = Recipe.create!(title: title, directions: directions)
    title = 'Soupers'
    title2 = 'Hungry Men'
    start = '2018-05-28'
    start2 = '2018-05-28'
    group = Group.create!(title: title, start: start, recipe_id: recipe.id)

    visit group_path(group)

    expect(page).to have_content(title)

    click_link 'Edit'

    fill_in 'group[title]', with: title2
    fill_in 'group[start]', with: start2
    click_button 'Create Group'

    expect(page).to have_content(title2)
    expect(page).to have_content(start2)
  end
end
