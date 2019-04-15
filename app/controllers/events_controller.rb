class EventsController < ApplicationController
  before_action :authenticate_admin!, only: %i[new create]

  def index
    @events = Event.apply_filters(
      params[:organizer_id],
      params[:city],
      params[:query]
    ).page(params[:page]).order(start_time: :desc)
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
      send_subscribers_alert
      redirect_to event_path(@event.id)
    else
      render :new
    end
  end

  def export
    event = Event.find(params[:id])
    send_data event.as_ics.to_ical, filename: "event_#{params[:id]}.ics"
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

  def send_subscribers_alert
    Subscriber.all.each do |s|
      SubscribersMailer.new_event(s.email).deliver_now
    end
  end
end
