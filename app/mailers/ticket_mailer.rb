class TicketMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ticket_mailer.booking_confirmed.subject
  #
  def booking_confirmed
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ticket_mailer.booking_rejected.subject
  #
  def booking_rejected
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
