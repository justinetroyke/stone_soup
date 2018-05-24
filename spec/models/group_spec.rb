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

  describe "methods" do
    it ".assign_ingredients assigns ingredient id to members" do
      ingredient = Ingredient.create!(item: 'butter')
      ingredient2 = Ingredient.create!(item: 'toast')
      amount = '4 tbs'
      amount2 = '2 pieces'
      title = 'Chicken Broccoli'
      directions = 'dump everything into pan, bake @ 350 degrees for 30 min'
      recipe = Recipe.create!(title: title, directions: directions)
      ri = RecipeIngredient.create!(ingredient_id: ingredient.id, recipe_id: recipe.id, ingredient_amount: amount)
      ri2 = RecipeIngredient.create!(ingredient_id: ingredient2.id, recipe_id: recipe.id, ingredient_amount: amount2)
      name = 'Justine Troyke'
      name2 = 'Deadpool'
      pass= 'password'
      role = 0
      role2 = 0
      email = 'abc@yo.edu'
      email2 = '123@yo.edu'
      member = Member.create!(name: name, username: name, password: pass, role: role, email: email)
      member2 = Member.create!(name: name2, username: name2, password: pass, role: role2, email: email2)
      start = '2018-05-28'
      group = Group.create!(title: title, start: start, recipe_id: recipe.id)
      GroupMember.create!(member_id: member.id, group_id: group.id)
      GroupMember.create!(member_id: member2.id, group_id: group.id)

      Group.assign_ingredients!(members: group.members, ingredients: recipe.ingredients)

      [member, member2].each do |m|
        m.reload
        expect(m.ingredient_id).to eq(ingredient.id).or(eq(ingredient2.id))
      end
    end

    it ".get_assignments retrieves ingredient assignments" do
      ingredient = Ingredient.create!(item: 'butter')
      ingredient2 = Ingredient.create!(item: 'toast')
      amount = '4 tbs'
      amount2 = '2 pieces'
      title = 'Chicken Broccoli'
      directions = 'dump everything into pan, bake @ 350 degrees for 30 min'
      recipe = Recipe.create!(title: title, directions: directions)
      ri = RecipeIngredient.create!(ingredient_id: ingredient.id, recipe_id: recipe.id, ingredient_amount: amount)
      ri2 = RecipeIngredient.create!(ingredient_id: ingredient2.id, recipe_id: recipe.id, ingredient_amount: amount2)
      name = 'Justine Troyke'
      name2 = 'Deadpool'
      pass= 'password'
      role = 0
      role2 = 0
      email = 'abc@yo.edu'
      email2 = '123@yo.edu'
      member = Member.create!(name: name, username: name, password: pass, role: role, email: email)
      member2 = Member.create!(name: name2, username: name2, password: pass, role: role2, email: email2)
      start = '2018-05-28'
      group = Group.create!(title: title, start: start, recipe_id: recipe.id)
      GroupMember.create!(member_id: member.id, group_id: group.id)
      GroupMember.create!(member_id: member2.id, group_id: group.id)
      # Group.assign_ingredients!(members: group.members, ingredients: recipe.ingredients)

      # Group.get_assignments!(members: group.members)

      # [member, member2].each do |m|
      #   expect(m.ingredient_id).to eq(ingredient.id).or(eq(ingredient2.id))
      # end
    end
  end
end
