class User < ApplicationRecord
  has_many :comments
  has_many :events, through: :comments
    has_secure_password

    validates :username, presence: true
    validates :email, presence: true
    validates :password, presence: true
    validates :email, uniqueness: true

end
