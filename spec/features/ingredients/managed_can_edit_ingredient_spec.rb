require 'rails_helper'

describe 'manager can delete ingredients' do
  scenario 'deletes through button on index' do
    item = 'Onino'
    item_2 = 'Onion'
    ingredient = Ingredient.create!(item: item)

    visit ingredients_path
    click_link 'Edit'
    fill_in 'ingredient[item]', with: item_2
    click_button 'Create Ingredient'

    expect(page).to have_content(item_2)
  end
end
