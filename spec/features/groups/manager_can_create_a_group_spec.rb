require 'rails_helper'

describe 'manager can create groups through /groups/new' do
  scenario 'sees new groups form' do
    title = 'Chicken Broccoli'
    directions = 'dump everything into pan, bake @ 350 degrees for 30 min'
    Recipe.create!(title: title, directions: directions)
    button = 'Create Group'

    visit groups_path

    click_on 'Create Group'

    expect(current_path).to eq(new_group_path)
    expect(page).to have_button(button)
    expect(page).to have_field('group[title]')
    expect(page).to have_field('Recipe')
  end

  scenario 'manager adds new group and directs to index' do
    title = 'Chicken Broccoli'
    directions = 'dump everything into pan, bake @ 350 degrees for 30 min'
    recipe = Recipe.create!(title: title, directions: directions)
    title = 'Soupers'
    heading = 'Groups'
    start = '2018-05-28'

    visit new_group_path

    fill_in 'group[title]', with: title
    fill_in 'Start', with: '2018/5/28'
    select(recipe.title, from: 'Recipe')
    click_button 'Create Group'

    expect(current_path).to eq groups_path
    expect(page).to have_link title
    expect(page).to have_content start
    expect(page).to have_content heading
  end
end
