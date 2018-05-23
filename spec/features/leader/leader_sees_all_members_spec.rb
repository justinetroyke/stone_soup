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
end
