class User < ApplicationRecord
    has_secure_password
    has_many :maintenances
    has_many :equipment, through: :maintenances

    validates :username, :email, presence: :true, uniqueness: :true
    validates :username, uniqueness: {case_sensitive: :false}
end
