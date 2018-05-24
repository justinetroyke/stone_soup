require 'rails_helper'

describe Member, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:role) }
    it { should validate_presence_of(:email) }
  end

  describe 'relationships' do
    it { should have_many(:group_members) }
  end

  describe 'roles' do
    it 'can be created as a leader' do
      name = 'Justine Troyke'
      password = 'password '
      role = 1
      email = 'bringit@yo.com'
      organizer = Member.create!(
        username: name,
        password: password,
        name: name,
        role: role,
        email: email
      )

      expect(organizer.role).to eq('leader')
      expect(organizer.leader?).to be_truthy
    end
  end

  it "can be created as a default member" do
    name = 'Deadpool'
    password = 'password '
    role = 0
    email = 'bringit@yo.com'
    member = Member.create!(
      username: name,
      password: password,
      name: name,
      role: role,
      email: email
    )

    expect(member.role).to eq('member')
    expect(member.member?).to be_truthy
  end
end
