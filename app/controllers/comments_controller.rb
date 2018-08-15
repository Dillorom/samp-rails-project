class CommentsController < ApplicationController
    def show
        @comment = Comment.find(params[:id])
        redirect_to :controller => 'events', :action => 'show'
    end

    def create
       
        @event = Event.find(params[:event_id])
        @comment = @event.comments.create(comments_params)
        #binding.pry
        @comment.user_id = current_user.id
        if @comment.save
           redirect_to @event
        else
           render 'events/show' #, :notice => "Comment can't be empty."
        end
    end

    def edit
        @event = Event.find(params[:event_id])
        #@comment = Comment.find(params[:id])
        @comment = @event.comments.find(params[:id])
        #redirect_to :controller => 'events', :action => 'show'
    end

    def update
        @event = Event.find(params[:event_id])
        @comment = @event.comments.find(params[:id])
        if @comment.update(comments_params)
            redirect_to @event
        else
            redirect_to @event#, :notice => "Comment can't be empty."
        end
    end

    def destroy
       
        @event = Event.find(params[:event_id])
        @comment = @event.comments.find(params[:id])
        if @comment.user_id == current_user.id
          @comment.delete
          redirect_to @event
        end
      end

    private

    def comments_params
        params.require(:comment).permit(:content, :user_id, :event_id)
    end
end