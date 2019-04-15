class SubscribersController < ApplicationController
  def create
    @subscriber = Subscriber.new(subscriber_params)
    if @subscriber.save
      render js: 'alert("Saved");'
    else
      render js: 'alert("Fill email field");'
    end
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:email)
  end
end
