class RsvpsController < ApplicationController
    before_action :logged_in
    before_action :authenticate_user!
    
    def index 
        @event = Event.find(params[:event_id])
        @rsvps = @event.rsvps
        respond_to do |f|
            f.html { render 'rsvps/index', :layout => false }
            f.json { render :json=>  @rsvps, :layout => false}
        end
    end

    def show
        @event = Event.find_by_id(params[:event_id])
        @rsvp = @event.rsvps.find(params[:id]) 
        
    end

    def new
        @event = Event.find_by_id(params[:event_id])
        @rsvp = Rsvp.new
    end
  
    def create
        @event = Event.find_by_id(params[:event_id])
        @rsvp = @event.rsvps.create(params[:rsvp_params])
        @rsvp.user = current_user
        if @rsvp.save
            redirect_to event_rsvp_path(@event, @rsvp) 
        else
            redirect_to @event
        end
      end

      def edit
        @event = Event.find_by_id(params[:event_id])
        @rsvp = @event.rsvps.find(params[:id])
      end
    
      def update
        @event = Event.find_by_id(params[:event_id])
        @rsvp = @event.rsvps.find(params[:id])
        if @rsvp.update_attributes rsvp_params
            redirect_to event_rsvp_path(@event, @rsvp) 
        else
            redirect_to @event
        end
      end

    private
    def rsvp_params
        params.require(:rsvp).permit(:attending)
    end
end