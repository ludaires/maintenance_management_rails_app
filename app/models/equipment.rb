class Equipment < ApplicationRecord
    has_many :maintenances
    has_many :users, through: :maintenances
end
