class CommentsController < ApplicationController
    def show
        @comment = Comment.find(params[:id])
        redirect_to :controller => 'events', :action => 'show'
    end

    def create
       
        @event = Event.find(params[:event_id])
        @comment = @event.comments.build(comments_params)
        @comment.user_id = current_user.id
        if @comment.save
           redirect_to @event
        else
           redirect_to @event, :notice => "Comment can't be empty."
        end
    end

    def destroy
        @event = Event.find(params[:event_id])
        @comment = @event.comments.find(params[:id])
        if @user == current_user
          @event.delete
          redirect_to root_path
        end
      end

    private

    def comments_params
        params.require(:comment).permit(:content, :user_id, :event_id)
    end
end