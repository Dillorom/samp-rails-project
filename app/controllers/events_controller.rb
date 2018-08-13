class EventsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def events_params
    params.require(:event).permit(:name, :time, :location, :details, :url, :image)
  end
end
