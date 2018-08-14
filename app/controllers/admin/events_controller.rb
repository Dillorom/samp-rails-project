class Admin::EventsController < ApplicationController
    def destroy
        @event = Event.find(params[:id])
        @event.delete
        redirect_to root_path
      end
end