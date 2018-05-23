require 'rails_helper'

describe Ingredient, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:item) }
  end

  describe 'relationships' do
    it { should have_many(:recipe_ingredients) }
  end
end
