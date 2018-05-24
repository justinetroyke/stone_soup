require 'rails_helper'

describe 'leader can delete members' do
  before do
    login_as_leader
  end
  scenario 'deletes through button on index' do
    name = 'Justine Troyke'
    password = 'password'
    email = 'it@yo.com'
    name2 = 'Deadpool'
    email2 = 'bringit@yo.com'
    member = Member.create!(
      username: name,
      password: password,
      name: name,
      role: 'member',
      email: email
    )

    visit members_path

    within("#member_#{member.id}") do
      click_link('Delete')
    end

    expect(page).to have_no_content(member)
  end
end
