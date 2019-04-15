class OrganizersController < ApplicationController
  def index
    @organizers = Organizer.all.order(id: :asc)
  end

  def show
    @organizer = Organizer.find(params[:id])
  end
end
