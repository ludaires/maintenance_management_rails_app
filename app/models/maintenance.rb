class Maintenance < ApplicationRecord
  belongs_to :user
  belongs_to :equipment
  has_many :inspections
 
  accepts_nested_attributes_for :inspections
  validates :next_maintenance_date, :status, :maintenance_type, presence: :true

  #show first all maintenance in progress

end
