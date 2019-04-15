class SubscribersMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def new_event(email)
    mail(to: email, subject: 'New Event')
  end
end
