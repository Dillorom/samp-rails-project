class Admin::CommentsController < ApplicationController

    def destroy
        @event = Event.find(params[:event_id])
        @comment = @event.comments.find(params[:id])
        @comment.delete
        redirect_to @event
    end
end