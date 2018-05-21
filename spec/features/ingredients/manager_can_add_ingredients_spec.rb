require 'rails_helper'

describe 'manager can add ingredients through /ingredients/new' do
  scenario 'sees new ingredients form' do
    button = 'Save and Add More Ingredients'
    button_2 = 'Create Ingredient'

    visit new_ingredient_path

    expect(page).to have_button(button)
    expect(page).to have_button(button_2)
    expect(page).to have_field('ingredient[item]')
  end

  scenario 'manager adds new ingredient and directs to show' do
    item = 'Onion'
    heading = 'Available Ingredients'
    button_2 = 'Create Ingredient'
    visit new_ingredient_path

    fill_in 'ingredient[item]', with: item
    click_button button_2

    expect(current_path).to eq ingredients_path
    expect(page).to have_content item
    expect(page).to have_content heading
  end

  scenario 'manager adds new ingredient and clicks add more' do
    item = 'Onion'
    item_2 = 'Honey soy marinade'
    button = 'Save and Add More Ingredients'
    button_2 = 'Create Ingredient'
    visit new_ingredient_path

    fill_in 'ingredient[item]', with: item
    click_button button

    expect(current_path).to eq new_ingredient_path
    expect(page).to have_content "#{item} added!"

    fill_in 'ingredient[item]', with: item_2
    click_button button_2

    expect(current_path).to eq ingredients_path
    expect(page).to have_content "#{item_2} added!"
    expect(page).to have_content item
    expect(page).to have_content item_2
  end

  scenario 'manager gets error message when no item is entered' do
    error_message = "Really!? there is only one field to complete... try again!"
    button = 'Save and Add More Ingredients'
    button_2 = 'Create Ingredient'
    visit new_ingredient_path

    click_button button

    expect(current_path).to eq new_ingredient_path
    expect(page).to have_content error_message

    click_button button_2

    expect(current_path).to eq new_ingredient_path
    expect(page).to have_content error_message
  end
end
