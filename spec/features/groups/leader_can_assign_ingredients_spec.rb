require 'rails_helper'

describe 'leader can assign ingredients once group has members' do
  before { login_as_leader }
  scenario 'it should show assignments on group page' do
    title = 'Chicken Broccoli'
    directions = 'dump everything into pan, bake @ 350 degrees for 30 min'
    recipe = Recipe.create!(title: title, directions: directions)
    name = 'Justine Troyke'
    name2 = 'Deadpool'
    name3 = 'Pocahantas'
    name4 = 'John Smith'
    pass = 'password'
    role = 0
    role2 = 0
    role3 = 0
    role4 = 0
    email = 'abc@yo.edu'
    email2 = '123@yo.edu'
    email3 = 'haha@yo.edu'
    email4 = 'yoyo@yo.edu'
    member = Member.create!(name: name, username: name, password: pass, role: role, email: email)
    member2 = Member.create!(name: name2, username: name2, password: pass, role: role2, email: email2)
    member3 = Member.create!(name: name3, username: name3, password: pass, role: role3, email: email3)
    member4 = Member.create!(name: name4, username: name4, password: pass, role: role4, email: email4)
    title = 'Rice as Nice'
    start = '2018-05-28'
    group = Group.create!(title: title, start: start, recipe_id: recipe.id)
    GroupMember.create!(group_id: group.id, member_id: member2.id)
    GroupMember.create!(group_id: group.id, member_id: member3.id)
    GroupMember.create!(group_id: group.id, member_id: member4.id)
    GroupMember.create!(group_id: group.id, member_id: member.id)
    item = 'Onion'
    item2 = 'chicken'
    item3 = 'rice'
    item4 = 'cream of broccoli'
    amount = '1'
    amount2 = '12 oz'
    amount3 = '3 cups'
    amount4 = '2 cans'
    ingredient = Ingredient.create!(item: item)
    ingredient2 = Ingredient.create!(item: item2)
    ingredient3 = Ingredient.create!(item: item3)
    ingredient4 = Ingredient.create!(item: item4)
    RecipeIngredient.create!(recipe_id: recipe.id, ingredient_id: ingredient.id, ingredient_amount: amount)
    RecipeIngredient.create!(recipe_id: recipe.id, ingredient_id: ingredient2.id, ingredient_amount: amount2)
    RecipeIngredient.create!(recipe_id: recipe.id, ingredient_id: ingredient3.id, ingredient_amount: amount3)
    RecipeIngredient.create!(recipe_id: recipe.id, ingredient_id: ingredient4.id, ingredient_amount: amount4)

    visit group_path(group)

    click_on 'Assign Ingredients'

    [member, member2, member3, member4].each do |membr|
      membr.reload
      expect(page).to have_content(membr.ingredient.item)
    end
  end
end
