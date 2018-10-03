class CommentsController < ApplicationController
    before_action :set_event, only: [:index, :create, :edit, :update, :destroy]
    
    def index
        @comments = @event.comments
        #binding.pry
        #render :json=>  @comments, :layout => false
        respond_to do |f|
            # f.html 
            # f.json { render json: @comments, :layout => false}
            f.html { render 'comments/index', :layout => false }
            f.json { render :json=>  @comments, :layout => false}
           
        end
    end

    def show
        @comment = Comment.find(params[:id])
        redirect_to :controller => 'events', :action => 'show'
    end

    def create
        @comment = @event.comments.create(comments_params)
        @comment.user_id = current_user.id
        if @comment.save
            redirect_to @event
            #render json: @comment
        else
           redirect_to @event, :notice => "Content can't be blank" 
        end
    end

    def edit
        @comment = @event.comments.find(params[:id])
    end

    def update
        @comment = @event.comments.find(params[:id])
        if @comment.update(comments_params)
            redirect_to @event
        else
            render 'events/show'
        end
    end

    def destroy
        @comment = @event.comments.find(params[:id])
        if @comment.user_id == current_user.id
          @comment.delete
          redirect_to @event
        end
      end

    private

    def set_event
        @event = Event.find(params[:event_id])
    end

    def comments_params
        params.require(:comment).permit(:content, :user_id, :event_id)
    end
end