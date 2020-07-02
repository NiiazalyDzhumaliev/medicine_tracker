class Medicine < ApplicationRecord
    belongs_to :author, foreign_key: :author_id, class_name: 'User'
    belongs_to :group, optional: true
    validates :name, presence: true, length: { in: 2..15 }
    validates :amount, presence: true, numericality: { less_than_or_equal_to: 1000, only_integer: true }
end
