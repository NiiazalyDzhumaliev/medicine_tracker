class Group < ApplicationRecord
  belongs_to :user
  has_many :groupings
  has_many :medicines, through: :groupings
  validates :name, presence: true, length: { in: 2..15 }
  validates :icon, format: { with: /.+\.(gif|jpe?g|png)\z/, message: 'Please use .gif, .jpeg, .jpg or .png' }
  validates :icon, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]), message: 'Please use a valid URL' }
end
