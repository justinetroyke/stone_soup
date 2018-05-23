require 'rails_helper'

describe 'Visitor' do
  context 'fills out a registration form and selects member role' do
    it 'should make a member account successfully' do
      name = 'Justine Troyke'
      username = 'j2thejt'
      email = 'jjtroyke@gmail.com'
      password = 'guesswhat2'
      role = 0

      visit '/'

      click_on 'Become a Stone Soup Member'

      expect(current_path).to eq(new_member_path)

      fill_in :member_username, with: username
      fill_in :member_name, with: name
      fill_in :member_password, with: password
      fill_in :member_email, with: email
      fill_in :member_role, with: role

      click_on 'Create Account'

      expect(current_path).to eq(member_path(Member.last.id))
      expect(page).to have_content("Welcome, #{Member.last.name}")
      expect(page).to have_content(email)
      expect(page).to have_content(role)
      expect(page).to have_content('Your group this week:')
      expect(page).to have_content('Your ingredient this week:')
    end
  end

  # context 'logs in' do
  #   it 'should log in the member' do
  #     username = 'octocat'
  #     password = 'password'
  #     user = User.create!(username: username, password: password)
  #
  #     visit '/'
  #
  #     click_on "Log in"
  #
  #     expect(current_path).to eq(login_path)
  #
  #     fill_in :username, with: username
  #     fill_in :password, with: password
  #     within('#login_form') do
  #       click_on "Log in"
  #     end
  #
  #     expect(current_path).to eq(user_path(user))
  #     expect(page).to have_link("Log out")
  #
  #     click_on "Log out"
  #     expect(current_path).to eq(root_path)
  #   end
  # end
  #   it 'should not allow duplicate usernames' do
  #     username = 'octocat'
  #     User.create(username: username, password: 'secret')
  #
  #     visit new_user_path
  #
  #     fill_in :user_username, with: username
  #     fill_in :user_password, with: 'supersecret12345'
  #
  #     click_on 'Create User'
  #
  #     expect(current_path).to eq(users_path)
  #     expect(page).to have_content('Registration failed')
  #   end
  # end
end
