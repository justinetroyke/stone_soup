require 'rails_helper'

describe Recipe, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:directions) }
  end
end
