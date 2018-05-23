require 'rails_helper'

describe 'Member visits members index page' do
  context "as admin" do
    it "allows admin to see all member's names" do
      name = 'Justine Troyke'
      password = 'password '
      role = 1
      email = 'bringit@yo.com'
      organizer = Member.create!(
        username: name,
        password: password,
        name: name,
        role: role,
        email: email
      )

      allow_any_instance_of(ApplicationController).to receive(:current_member).and_return(organizer)

      visit leader_members_path

      expect(page).to have_content('Stone Soup Members')
    end
  end

  context 'as default member' do
    it 'does not allow member to see members' do
      name = 'Deadpool'
      password = 'password'
      role = 0
      email = 'takeonme@yo.com'
      member = Member.create!(
        username: name,
        password: password,
        name: name,
        role: role,
        email: email
      )

      allow_any_instance_of(ApplicationController).to receive(:current_member).and_return(member)

      visit leader_members_path

      expect(page).to_not have_content('Stone Soup Members')
      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
