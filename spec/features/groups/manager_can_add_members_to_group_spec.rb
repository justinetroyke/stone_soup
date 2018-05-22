require 'rails_helper'

describe 'manager can add groups through /groups/new' do
  scenario 'sees new groups form' do
    button = 'Create Group'

    visit new_group_path

    expect(page).to have_button(button)
    expect(page).to have_field('group[title]')
  end

  scenario 'manager adds new group and directs to index' do
    title = 'Soupers'
    heading = 'Groups'
    start = '2018-05-28'

    visit new_group_path

    fill_in 'group[title]', with: title
    fill_in 'Start', with: '2018/5/28'
    click_button 'Create Group'

    expect(current_path).to eq groups_path
    expect(page).to have_link title
    expect(page).to have_content start
    expect(page).to have_content heading
  end

  scenario 'manager clicks on group link and directs to show' do
    title = 'Soupers'
    start = '2018-05-28'
    title2 = 'Hungry Men'
    start2 = '2018-05-28'
    group = Group.create!(title: title, start: start)
    group2 = Group.create!(title: title2, start: start2)

    visit groups_path

    click_link title2

    expect(current_path).to eq group_path(group2)
    expect(page).to have_content start2
    expect(page).to have_content "#{title2} Group"
  end
end
