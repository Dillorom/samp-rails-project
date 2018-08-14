class CommentsController < ApplicationController
    def new
        @comment = Comment.new
    end

    def show
        @comment = Comment.find(params[:id])
    end

    def create
        @comment = Comment.create(comment_params)
        if @comment.save
            redirect_to @event.comment
        else
            redirect_to @event
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.delete
        redirect_to @event
    end

    private

    def comments_params
        params.require(:comment).permit(:content, :user_id, :event_id)
    end
end