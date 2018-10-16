class RsvpSerializer < ActiveModel::Serializer
  attributes :id, :attending
  belongs_to :user, serializer: RsvpUserSerializer
  belongs_to :event, serializer: RsvpEventSerializer
end
