require 'rails_helper'

describe 'manager can edit groups' do
  scenario 'edits through button on index' do
    title = 'Soupers'
    title2 = 'Hungry Men'
    start = '2018-05-28'
    Group.create!(title: title, start: start)

    visit groups_path

    expect(page).to have_content(title)

    click_link 'Edit'
    fill_in 'group[title]', with: title2
    click_button 'Create Group'

    expect(page).to have_content(title2)
    expect(page).to have_content(start)
  end

  scenario 'edits through button on show' do
    title = 'Soupers'
    title2 = 'Hungry Men'
    start = '2018-05-28'
    start2 = '2018-05-28'
    group = Group.create!(title: title, start: start)

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
