class Group < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :start, presence: true
end
