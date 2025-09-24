class EventsController < ApplicationController
  def index
    @events = Event.upcoming   # or Event.all if you just want everything
  end

  def show
    @event = Event.find(params[:id])
  end
end

