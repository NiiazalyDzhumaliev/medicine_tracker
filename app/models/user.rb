class User < ApplicationRecord
    has_many :medicines, foreign_key: :author_id
    validates :username, presence: true, uniqueness: true, length: { in: 2..10 }
    validates :name, presence: true
end
