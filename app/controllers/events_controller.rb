class EventsController < ApplicationController
  def index
    @events = Event.all.order(start_time: :desc)
  end

  def show
  end
end
