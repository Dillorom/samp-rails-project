class Rsvp < ApplicationRecord
    belongs_to :user
    belongs_to :event
    validates :user, uniqueness: {scope: :event,
    message: "You are already attending this event!" }

end
