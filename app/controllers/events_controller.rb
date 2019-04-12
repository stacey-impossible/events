class EventsController < ApplicationController
  before_action :authenticate_admin!, only: %i[new create]

  def index
    @events = case params[:query]
              when 'coming'
                Event.coming
              when 'past'
                Event.past
              else
                Event
              end
    @events = @events.page(params[:page]).order(start_time: :desc)
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
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
      :cover,
      :organizer_id
    )
  end
end
