class Group < ApplicationRecord
    belongs_to :user
    has_many :medicines
    validates :name, presence: true, length: { in: 2..15 }
end
