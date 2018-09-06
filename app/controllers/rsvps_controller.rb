class RsvpsController < ApplicationController
    before_action :logged_in
  
  
  
    def new
    #binding.pry
      @events = Event.all
      @event = Event.find_by_id(params[:event_id])
      @rsvp = Rsvp.create(user_id: @user.id, event_id: @event.id)
   
    end
  
    def create
        @rsvp = Rsvp.new rsvp_params
        @rsvp.user = current_user
        if @rsvp.save
            redirect to @rsvp
        else
            redirect to @event
        end
      end
    
      def update
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
        params.require(:rsvp).permit(:user_id, :event_id, :id)
    end
end