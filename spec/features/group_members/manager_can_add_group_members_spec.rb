require 'rails_helper'

describe 'manager can add members to group through' do
  scenario 'manager adds members to group and directs to index' do
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

    visit group_path(group)

    expect(page).to have_content group.title
    expect(page).to have_content group.start

    select(member.name, from: 'Member')
    click_on 'Add'
    expect(page).to have_content(GroupMember.last.member.name)

    select(member2.name, from: 'Member')
    click_on 'Add'

    expect(page).to have_content(GroupMember.last.member.name)

    select(member3.name, from: 'Member')
    click_on 'Add'

    expect(page).to have_content(GroupMember.last.member.name)

    select(member4.name, from: 'Member')
    click_on 'Add'

    expect(current_path).to eq group_path(group)
    expect(page).to have_content member.name
    expect(page).to have_content member2.name
    expect(page).to have_content member3.name
    expect(page).to have_content member4.name
  end
end
