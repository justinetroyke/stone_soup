require 'rails_helper'

describe 'Member visits members index page' do
  context "as leader" do
    it "shows members link in after logging in" do
      name = 'Justine Troyke'
      password = 'password '
      role = 1
      email = 'bringit@yo.com'
      leader = Member.create!(
        username: name,
        password: password,
        name: name,
        role: role,
        email: email
      )

      allow_any_instance_of(ApplicationController).to receive(:current_member).and_return(leader)

      visit leader_member_path(leader)

      expect(page).to have_link('Members')
    end
  end
end
