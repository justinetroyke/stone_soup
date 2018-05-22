class Member < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :role, presence: true
  validates :email, presence: true
end
