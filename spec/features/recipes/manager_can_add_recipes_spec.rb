require 'rails_helper'

describe 'manager can add recipes through /recipes/new' do
  scenario 'sees new recipes form' do
    button = 'Create Recipe'
    visit new_recipe_path

    expect(page).to have_button(button)
    expect(page).to have_field('recipe[name]')
  end

  # scenario 'manager adds new recipe and directs to show' do
  #   item = 'Onion'
  #   heading = 'Available Recipes'
  #   button_2 = 'Create Recipe'
  #   visit new_recipe_path
  #
  #   fill_in 'recipe[item]', with: item
  #   click_button button_2
  #
  #   expect(current_path).to eq recipes_path
  #   expect(page).to have_content item
  #   expect(page).to have_content heading
  # end
  #
  # scenario 'manager adds new recipe and clicks add more' do
  #   item = 'Onion'
  #   item_2 = 'Honey soy marinade'
  #   button = 'Save and Add More Recipes'
  #   button_2 = 'Create Recipe'
  #   visit new_recipe_path
  #
  #   fill_in 'recipe[item]', with: item
  #   click_button button
  #
  #   expect(current_path).to eq new_recipe_path
  #   expect(page).to have_content "#{item} added!"
  #
  #   fill_in 'recipe[item]', with: item_2
  #   click_button button_2
  #
  #   expect(current_path).to eq recipes_path
  #   expect(page).to have_content "#{item_2} added!"
  #   expect(page).to have_content item
  #   expect(page).to have_content item_2
  # end
  #
  # scenario 'manager gets error message when no item is entered' do
  #   error_message = "Really!? there is only one field to complete... try again!"
  #   button = 'Save and Add More Recipes'
  #   button_2 = 'Create Recipe'
  #   visit new_recipe_path
  #
  #   click_button button
  #
  #   expect(current_path).to eq new_recipe_path
  #   expect(page).to have_content error_message
  #
  #   click_button button_2
  #
  #   expect(current_path).to eq new_recipe_path
  #   expect(page).to have_content error_message
  # end
end
