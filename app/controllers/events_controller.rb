class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
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
    @event.delete
    redirect_to root_path
  end

  private

  def events_params
    params.require(:event).permit(:name, :time, :location, :details, :url, :image)
  end
end
