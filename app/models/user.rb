class User < ActiveRecord::Base
    has_many :medicines
    has_secure_password
    validates :name, presence: true, uniqueness: true
    validates :password, presence: true
end
