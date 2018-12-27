class User < ApplicationRecord
    has_secure_password
    has_many :maintenances
    has_many :equipment, through: :maintenances
end
