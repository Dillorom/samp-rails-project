class RsvpsController < ApplicationController
    before_action :logged_in, :authenticate_user!, :set_event

    
    def index 
        @rsvps = Rsvp.all
    end

    def show
        @rsvp = @event.rsvps.find(params[:id]) 
        
    end

    def new
        @rsvp = Rsvp.new
    end
  
    def create
        @rsvp = @event.rsvps.create(rsvp_params)
        @rsvp.user = current_user
        if @rsvp.save
            redirect_to event_rsvp_path(@event, @rsvp) 
        else
            redirect_to @event
        end
      end

      def edit
        @rsvp = @event.rsvps.find(params[:id])
      end
    
      def update
        @rsvp = @event.rsvps.find(params[:id])
        if @rsvp.update_attributes rsvp_params
            redirect_to event_rsvp_path(@event, @rsvp) 
        else
            redirect_to @event
        end
      end

    private

    def set_event
        @event = Event.find_by_id(params[:event_id])
    end
    
    def rsvp_params
        params.require(:rsvp).permit(:attending)
    end
end