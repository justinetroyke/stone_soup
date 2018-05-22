require 'rails_helper'

describe 'manager can delete groups' do
  scenario 'deletes through button on index' do
    title = 'Soupers'
    start = '2018-05-28'
    group = Group.create!(title: title, start: start)

    visit groups_path

    expect(page).to have_content(group.title)

    click_link 'Delete'

    expect(page).to have_no_content(group)
  end

  scenario 'deletes through button on show' do
    title = 'Soupers'
    start = '2018-05-28'
    group = Group.create!(title: title, start: start)

    visit group_path(group)

    expect(page).to have_content(group.start)

    click_link 'Delete'

    expect(current_path).to eq groups_path
  end
end
