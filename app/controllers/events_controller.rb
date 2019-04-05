class EventsController < ApplicationController
  before_action :authenticate_organizer!, only: %i[new create]

  def index
    @events = Event.page(params[:page]).order(start_time: :desc)
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params.merge(organizer_id: current_organizer.id))

    if @event.save
      redirect_to event_path(@event.id)
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(
      :title,
      :city,
      :description,
      :start_time,
      :address,
      :link,
      :cover
    )
  end
end
