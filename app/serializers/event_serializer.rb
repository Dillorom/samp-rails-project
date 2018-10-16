class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :time, :details, :url, :image
  has_many :rsvps
  
  # def event_name
  #   self.object.name
  # end
  
end
