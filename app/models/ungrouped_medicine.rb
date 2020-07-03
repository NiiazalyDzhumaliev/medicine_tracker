class UngroupedMedicine < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: { in: 2..15 }
  validates :amount, presence: true, numericality: { less_than_or_equal_to: 1000, only_integer: true }
end
