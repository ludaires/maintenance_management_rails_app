class Maintenance < ApplicationRecord
  belongs_to :user
  belongs_to :equipment
  has_many :inspections
end
