class User < ApplicationRecord
  has_many :comments
  has_many :events, through: :comments
  has_secure_password

    validates :username, presence: true
    validates :email, presence: true
    #validates :password, presence: true
    #validates :email, uniqueness: true
  
  def self.from_omniauth(auth)
      where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.username = auth.info.name
        user.email = auth.info.email
        user.password_digest = auth.info.password
        user.oauth_token = auth.credentials.token
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)
        user.save!
      end
    end
end
