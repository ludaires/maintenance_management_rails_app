class Equipment < ApplicationRecord
    has_many :maintenances
    has_many :users, through: :maintenances


    scope :ordered_by_next_maintenance, -> { joins(:maintenances).where('next_maintenance_date')}

end
