require 'rails_helper'

describe 'manager can assign ingredients once group has members' do
  scenario 'it should show assignments on group page' do
    title = 'Chicken Broccoli'
    directions = 'dump everything into pan, bake @ 350 degrees for 30 min'
    recipe = Recipe.create!(title: title, directions: directions)
    name = 'Justine Troyke'
    name2 = 'Deadpool'
    name3 = 'Pocahantas'
    name4 = 'John Smith'
    pass = 'password'
    role = 'Member'
    role2 = 'Member'
    role3 = 'Member'
    role4 = 'Member'
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

    visit group_path(group)

    click_on 'Assign Ingredients'

    expect(page).to have_content(member.ingredient.item)
    expect(page).to have_content(member2.ingredient.item)
    expect(page).to have_content(member3.ingredient.item)
    expect(page).to have_content(member4.ingredient.item)
  end
end
