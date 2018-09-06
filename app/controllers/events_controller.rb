class EventsController < ApplicationController
   before_action :authenticate_user!, only: [:edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @rsvp = @event.rsvps.find_or_initialize_by user: current_user if current_user
    @comment = Comment.new
    if logged_in
      @comment.user_id = current_user.id
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(events_params)
    if @event.save
      redirect_to @event
    else
      render :new
    end
  end

  def edit
   @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(events_params)
      redirect_to @event
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    if @user == current_user
      @event.delete
      redirect_to root_path
    end
  end

  private

  def events_params
    params.require(:event).permit(:name, :time, :location, :details, :url, :image)
  end
end
