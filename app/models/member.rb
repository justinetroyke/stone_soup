class Member < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :type, presence: true
  validates :email, presence: true
end
