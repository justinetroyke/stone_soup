require 'rails_helper'

describe 'manager can add ingredients through /ingredients/new' do
  scenario 'sees new ingredients form' do
    visit new_ingredient_path

    expect(page).to have_button('Save and Add More Ingredients')
    expect(page).to have_button('Create Ingredient')
    expect(page).to have_field('ingredient[item]')
  end

  scenario 'manager adds new ingredient and directs to show' do
    item = 'Onion'
    heading = 'Available Ingredients'
    visit new_ingredient_path

    fill_in 'ingredient[item]', with: item
    click_button 'Create Ingredients'
    save_and_open_page

    expect(current_path).to eq ingredients_path
    expect(page).to have_content item
    expect(page).to have_content heading
  end
end

# expect(page).to have_selector('input', :value =>'item')

# item_1 = 'pork spare ribs'
# item_2 = 'honey soy marinade'
# item_3 = 'microwavable white long grain rice'
# item_4 = 'salad'

# ingredient_1 = Ingredient.create!(item: item_1)
# ingredient_2 = Ingredient.create!(item: item_2)
# ingredient_3 = Ingredient.create!(item: item_3)
# ingredient_4 = Ingredient.create!(item: item_4)

# fill_in 'item', with: item_1
# fill_in 'item', with: item_2
# fill_in 'item', with: item_3
# fill_in 'item', with: item_4
#
# expect(current_path).to eq ingredients_path
# expect(page).to have_content(item_1)
# expect(page).to have_content(item_2)
# expect(page).to have_content(item_3)
# expect(page).to have_content(item_4)
