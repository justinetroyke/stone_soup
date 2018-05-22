require 'rails_helper'

describe 'manager can add members through /members/new' do
  scenario 'sees new members form' do
    button = 'Save and Add Another Member'
    button_2 = 'Create Member'

    visit new_member_path

    expect(page).to have_button(button)
    expect(page).to have_button(button_2)
    expect(page).to have_field('member[name]')
    expect(page).to have_field('member[role]')
    expect(page).to have_field('member[email]')
  end

  scenario 'manager adds new member and directs to show' do
    name = 'Justine Troyke'
    role = 'Member'
    email = 'bringit@poop.com'
    heading = 'Stone Soup Members'
    button_2 = 'Create Member'

    visit new_member_path

    fill_in 'member[name]', with: name
    fill_in 'member[role]', with: role
    fill_in 'member[email]', with: email

    click_button button_2

    expect(current_path).to eq members_path
    expect(page).to have_content name
    expect(page).to have_content heading
  end

  scenario 'manager adds new member and clicks add more' do
    name = 'Justine Troyke'
    role = 'Member'
    email = 'bringit@poop.com'
    name_2 = 'Justin Tro'
    role_2 = 'Member'
    email_2 = 'ald@poop.com'
    button = 'Save and Add Another Member'
    button_2 = 'Create Member'

    visit new_member_path

    fill_in 'member[name]', with: name
    fill_in 'member[role]', with: role
    fill_in 'member[email]', with: email
    click_button button

    expect(current_path).to eq new_member_path
    expect(page).to have_content "#{name} added!"

    fill_in 'member[name]', with: name_2
    fill_in 'member[role]', with: role_2
    fill_in 'member[email]', with: email_2
    click_button button_2

    expect(current_path).to eq members_path
    expect(page).to have_content "#{name_2} added!"
    expect(page).to have_content name
    expect(page).to have_content name_2
  end

  scenario 'manager gets error message when no name is entered' do
    role = 'Member'
    email = 'bringit@poop.com'
    error_message = 'Check all fields have been completed and try again!'
    button = 'Save and Add Another Member'
    button_2 = 'Create Member'

    visit new_member_path

    fill_in 'member[role]', with: role
    fill_in 'member[email]', with: email
    click_button button

    expect(current_path).to eq new_member_path
    expect(page).to have_content error_message

    fill_in 'member[role]', with: role
    fill_in 'member[email]', with: email
    click_button button_2

    expect(current_path).to eq new_member_path
    expect(page).to have_content error_message
  end
end