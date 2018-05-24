require 'rails_helper'

describe 'leader can delete groups' do
  before { login_as_leader }

  scenario 'deletes through button on index' do
    title = 'Chicken Broccoli'
    directions = 'dump everything into pan, bake @ 350 degrees for 30 min'
    recipe = Recipe.create!(title: title, directions: directions)
    title = 'Soupers'
    start = '2018-05-28'
    group = Group.create!(title: title, start: start, recipe_id: recipe.id)

    visit groups_path

    expect(page).to have_content(group.title)

    click_link 'Delete'

    expect(page).to have_no_content(group)
  end

  scenario 'deletes through button on show' do
    title = 'Chicken Broccoli'
    directions = 'dump everything into pan, bake @ 350 degrees for 30 min'
    recipe = Recipe.create!(title: title, directions: directions)
    title = 'Soupers'
    start = '2018-05-28'
    group = Group.create!(title: title, start: start, recipe_id: recipe.id)

    visit group_path(group)

    expect(page).to have_content(group.start)

    click_link 'Delete'

    expect(current_path).to eq groups_path
  end
end
