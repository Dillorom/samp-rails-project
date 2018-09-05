class RsvpsController < ApplicationController
    def new
        @rsvp = Rsvp.new
    end
    
    def delete
        @rsvp = Rsvp.find_by_id(id)
        @rsvp.delete
    end
end