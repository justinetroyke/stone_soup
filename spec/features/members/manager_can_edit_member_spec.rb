require 'rails_helper'

describe 'manager can edit members' do
  scenario 'edits through button on index' do
    name = 'Justine Troyke'
    role = 'Member'
    email = 'bringit@poop.com'
    name2 = 'JJ Troyke'
    Member.create!(name: name, role: role, email: email)

    visit members_path

    expect(page).to have_content(name)

    click_link 'Edit'
    fill_in 'member[name]', with: name2
    click_on 'Create Member'

    expect(page).to have_content(name2)
  end
end
