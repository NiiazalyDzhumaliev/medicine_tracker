class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true, length: { in: 2..10 }
    validates :username, presence: true
end
