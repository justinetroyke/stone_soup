require 'rails_helper'

describe 'leader can delete ingredients' do
  before { login_as_leader }
  scenario 'deletes through button on index' do
    item = 'Onion'
    ingredient = Ingredient.create!(item: item)

    visit ingredients_path
    click_link 'Delete'

    expect(page).to have_no_content(ingredient)
  end
end
