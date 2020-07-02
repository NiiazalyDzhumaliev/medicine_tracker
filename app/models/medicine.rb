class Medicine < ApplicationRecord
    belongs_to :author, foreign_key: :author_id, class_name: 'User'
    validates :name, presence: true, length: { in: 2..15 }
    validates :amount, presence: true, numericality: { less_than_or_equal_to: 100, only_integer: true }
end
