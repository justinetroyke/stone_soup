require 'rails_helper'

describe 'leader can delete ingredients' do
  before { login_as_leader }
  scenario 'deletes through button on index' do
    item = 'Onino'
    item_2 = 'Onion'
    Ingredient.create!(item: item)

    visit ingredients_path
    click_link 'Edit'
    fill_in 'ingredient[item]', with: item_2
    click_on 'Create Ingredient'

    expect(page).to have_content(item_2)
  end
end
