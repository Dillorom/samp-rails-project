class EventSerializer < ActiveModel::Serializer
  attributes :id, :event_name
  has_many :rsvps

  def event_name
    binding.pry
    self.object.name
  end
end
