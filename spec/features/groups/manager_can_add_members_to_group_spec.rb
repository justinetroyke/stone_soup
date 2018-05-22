require 'rails_helper'

describe 'manager can add groups through /groups/new' do
  scenario 'sees new groups form' do
    button = 'Create Group'
    
    visit new_group_path

    expect(page).to have_button(button)
    expect(page).to have_field('group[title]')
  end
  #
  # scenario 'manager adds new group and directs to index' do
  #   title = 'Chicken Broccoli'
  #   directions = 'dump everything into pan, bake @ 350 degrees for 30 min'
  #   heading = 'Groups'
  #
  #   visit new_group_path
  #
  #   fill_in 'group[title]', with: title
  #   fill_in 'group[directions]', with: directions
  #   click_button 'Create Group'
  #
  #   expect(current_path).to eq groups_path
  #   expect(page).to have_link title
  #   expect(page).to have_content heading
  # end
  #
  # scenario 'manager clicks on group link and directs to show' do
  #   title = 'Chicken Broccoli'
  #   title_2 = 'Taco Salad'
  #   directions = 'dump everything into pan, bake @ 350 degrees for 30 min'
  #   directions_2 = 'grill chicken, put stuff in bowl, mix'
  #   group = Group.create!(title: title, directions: directions)
  #   group_2 = Group.create!(title: title_2, directions: directions_2)
  #
  #   visit groups_path
  #
  #   click_link title_2
  #
  #   expect(current_path).to eq group_path(group_2)
  #   expect(page).to have_content directions_2
  #   expect(page).to have_content "#{title_2} Group"
  # end
end
