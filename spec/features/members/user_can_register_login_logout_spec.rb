require 'rails_helper'

describe 'Visitor' do
  context 'fills out a registration form and selects member role' do
    it 'should make a member account successfully' do
      name = 'Justine Troyke'
      username = 'j2thejt'
      email = 'jjtroyke@gmail.com'
      password = 'guesswhat2'
      role = 'member'

      visit '/'

      click_link 'Register'

      expect(current_path).to eq(new_member_path)

      fill_in :member_username, with: username
      fill_in :member_name, with: name
      fill_in :member_password, with: password
      fill_in :member_email, with: email
      fill_in :member_role, with: role

      click_on 'Create Account'

      expect(current_path).to eq(member_path(Member.last.id))
      expect(page).to have_content("Welcome, #{Member.last.name}!")
      expect(page).to have_content(email)
      expect(page).to have_content(role)
      expect(page).to have_content('Your group this week:')
      expect(page).to have_content('Your ingredient this week:')
    end
  end

  context 'logs in' do
    it 'should log in the member' do
      name = 'Justine Troyke'
      pass = 'password'
      role = 'member'
      email = 'abc@yo.edu'
      member = Member.create!(name: name, username: name, password: pass, role: role, email: email)

      visit '/'

      click_link "Login"

      expect(current_path).to eq(login_path)


      fill_in :username, with: name
      fill_in :password, with: pass
      within('#login_form') do
        click_on "Log in"
      end

      expect(current_path).to eq(member_path(member))
      expect(page).to have_content("Log out")

      click_on "Log out"
      expect(current_path).to eq(root_path)
    end
  end

  it 'should not allow duplicate usernames' do
    username = 'octocat'
    name = 'Justine Troyke'
    pass = 'password'
    role = 0
    email = 'abc@yo.edu'
    Member.create(username: username, password: pass, name: name, role: role, email: email)

    visit new_member_path

    fill_in :member_username, with: username
    fill_in :member_password, with: 'supersecret12345'

    click_on 'Create Account'

    expect(current_path).to eq(new_member_path)
    expect(page).to have_content('Registration fail, Please try again!')
  end
end
