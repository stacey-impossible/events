class EventsController < ApplicationController
  def index
    @events = Event.page(params[:page]).order(start_time: :desc)
  end

  def show
  end
end
