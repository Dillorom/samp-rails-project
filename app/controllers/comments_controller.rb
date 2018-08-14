class CommentsController < ApplicationController
    def new
    end

    def show
    end

    def create
    end

    def destroy
    end

    private

    def comments_params
        params.require(:comment).permit(:content, :user_id, :event_id)
    end
end