class Maintenance < ApplicationRecord
  belongs_to :user
  belongs_to :equipment
  has_many :inspections, inverse_of: :maintenance
 
  # method to create nested forms.
  accepts_nested_attributes_for :inspections
  
  validates :next_maintenance_date, :status, :maintenance_type, presence: :true
     #show first five  next  maintenance schedule it
  scope :ordered_by_next_maintenance, -> { order(next_maintenance_date: :desc).limit(5)}
end
