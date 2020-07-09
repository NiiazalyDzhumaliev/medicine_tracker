class Grouping < ApplicationRecord
  belongs_to :group
  belongs_to :medicine 

  scope :occurence_in_group, ->(medicine) { where(medicine: medicine) }
  
end
