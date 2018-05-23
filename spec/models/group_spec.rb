require 'rails_helper'

describe Group, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:start) }
  end

  describe 'relationships' do
    it { should belong_to(:recipe) }
    it { should have_many(:group_members) }
  end

  # describe "scopes" do
  #   it ".assign_ingredients assigns ingredient id to members" do
  #     product = create(:product)
  #     title = 'Chicken Broccoli'
  #     directions = 'dump everything into pan, bake @ 350 degrees for 30 min'
  #     recipe = Recipe.create!(title: title, directions: directions)
  #     name = 'Justine Troyke'
  #     name2 = 'Deadpool'
  #     name3 = 'Pocahantas'
  #     name4 = 'John Smith'
  #     role = 'Member'
  #     role2 = 'Member'
  #     role3 = 'Member'
  #     role4 = 'Member'
  #     email = 'abc@yo.edu'
  #     email2 = '123@yo.edu'
  #     email3 = 'haha@yo.edu'
  #     email4 = 'yoyo@yo.edu'
  #     member = Member.create!(name: name, role: role, email: email)
  #     member2 = Member.create!(name: name2, role: role2, email: email2)
  #     member3 = Member.create!(name: name3, role: role3, email: email3)
  #     member4 = Member.create!(name: name4, role: role4, email: email4)
  #     title = 'Rice as Nice'
  #     start = '2018-05-28'
  #     group = Group.create!(title: title, start: start, recipe_id: recipe.id)
  #
  #     expect(member.).to eq(love_vote)
  #   end
end
