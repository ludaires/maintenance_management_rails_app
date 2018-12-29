class User < ApplicationRecord
    has_secure_password
    has_many :maintenances
    has_many :equipment, through: :maintenances

    validates :username, :email, :password, presence: :true, uniqueness: :true
    validates :username, uniqueness: {case_sensitive: :false}
end
