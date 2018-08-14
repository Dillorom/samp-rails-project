class CommentsController < ApplicationController
    def show
        @comment = Comment.find(params[:id])
    end

    def create
        #binding.pry
        @event = Event.find(params[:event_id])
        @comment = @event.comments.build(comments_params)
        if @comment.save
            redirect_to event_comment_path(@comment.event, @comment)
        else
            redirect_to @event
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