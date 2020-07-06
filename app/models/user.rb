class User < ApplicationRecord
  has_many :medicines, foreign_key: :author_id
  has_many :ungrouped_medicines
  has_many :groups
  validates :username, presence: true, uniqueness: true, length: { in: 2..10 }
  validates :name, presence: true
end
