class User < ApplicationRecord
  has_many :comments
  has_many :events, through: :comments
    has_secure_password

    validates :username, presence: true
    validates :email, presence: true
    validates :password, presence: true
    validates :email, uniqueness: true

  
    def self.sign_in_from_omniauth(auth)
      #binding.pry
      find_by(provider: auth['provider'], uid: auth['uid']) || create_user_from_omniauth(auth)

    end

    def self.create_user_from_omniauth(auth)
      create(
        provider: auth['provider'],
        uid: auth['uid'],
        username: auth['info']['name']
      )
    end


end
