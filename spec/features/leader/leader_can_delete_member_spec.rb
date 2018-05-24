require 'rails_helper'

describe 'leader can delete members' do
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
    leader = Member.create!(
      username: name2,
      password: password,
      name: name2,
      role: 'leader',
      email: email2
    )

    allow_any_instance_of(ApplicationController).to receive(:current_member).and_return(leader)

    visit members_path

    within("#member_#{member.id}") do
      click_link('Delete')
    end

    expect(page).to have_no_content(member)
  end
end
