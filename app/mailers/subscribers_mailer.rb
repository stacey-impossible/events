class SubscribersMailer < ApplicationMailer
  default from: 'app130129296@heroku.com'

  def new_event(email)
    mail(to: email, subject: 'New Event')
  end
end
