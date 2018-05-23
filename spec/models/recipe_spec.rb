require 'rails_helper'

describe Recipe, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:directions) }
  end

  describe 'relationships' do
    it { should have_many(:recipe_ingredients) }
    it { should have_many(:groups) }
  end
end
