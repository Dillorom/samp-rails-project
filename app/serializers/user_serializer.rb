class UserSerializer < ActiveModel::Serializer
  attributes :id, :username
  has_many :comments
  has_many :rsvps
  has_many :attending_events, through: :rsvps, :source => :event
end
