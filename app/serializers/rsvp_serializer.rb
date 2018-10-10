class RsvpSerializer < ActiveModel::Serializer
  attributes :id, :attending
  belongs_to :user, serializer: RsvpUserSerializer
end
