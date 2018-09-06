class RsvpsController < ApplicationController
    before_action :logged_in
    
    def index 
        @rsvps = Rsvp.all
    end

    def show
        #binding.pry
        @event = Event.find_by_id(params[:event_id])
        @rsvp = @event.rsvps.find(params[:id])

    end

    def new
    #binding.pry
      @event = Event.find_by_id(params[:event_id])
      @rsvp = Rsvp.create(rsvp_params)
   
    end
  
    def create
        @event = Event.find_by_id(params[:event_id])
        #@rsvp = @event.rsvps.new(rsvp_params.merge(user_id: @user.id, event_id: @event.id))  
        @rsvp = @event.rsvps.build(rsvp_params)     
        @rsvp.user = current_user
        if @rsvp.save
            redirect to @rsvp
        else
            redirect to @event
        end
      end

      def edit
        @event = Event.find_by_id(params[:event_id])
        @rsvp = @event.rsvps.find(params[:id])
      end
    
      def update
        # research rails update attributes methods
        if @rsvp.update_attributes rsvp_params
            redirect to @rsvp
        else
            redirect to @event
        end
      end
  
    def destroy
      @rsvp = Rsvp.find_by_id(params[:id])
      @rsvp.destroy
      redirect_to @event
    end

    private
    def rsvp_params
        #binding.pry
        params.permit(:attending)
    end
end