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
end
