class Member < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :role, presence: true
  validates :email, presence: true
  has_many :group_members
end
