class Member < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :email, uniqueness: true, presence: true
  validates :role, presence: true
  validates :username, uniqueness: true, presence: true
  validates_presence_of :password, require: true, on: :create

  has_secure_password

  enum role: [:member, :leader]

  has_many :group_members
  belongs_to :ingredient, optional: true
end
