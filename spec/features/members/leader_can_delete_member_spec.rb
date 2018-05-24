require 'rails_helper'

describe 'leader can delete members' do
  before { login_as_leader }
  scenario 'deletes through button on index' do
    name = 'Justine Troyke'
    pass = 'password '
    role = 'member'
    email = 'bringit@poop.com'
    member = Member.create!(username: name, password: pass, name: name, role: role, email: email)

    visit members_path
    click_link 'Delete'

    expect(page).to have_no_content(member)
  end
end
