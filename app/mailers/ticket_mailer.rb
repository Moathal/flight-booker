class TicketMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ticket_mailer.booking_confirmed.subject
  #
  def booking_confirmed(ticket)
    @greeting = "Hello Miss/Mr. #{last_name(ticket.fullname)}"
    @ticket = ticket
    mail(to: @ticket.email, subject: 'Booking Confirmed')
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ticket_mailer.booking_rejected.subject
  #
  def booking_rejected(ticket)
    @greeting = "Hello Miss/Mr. #{last_name(ticket.fullname)}"
    @ticket = ticket
    mail(to: @ticket.email, subject: 'Booking Rejected')
  end
  
  def booker_mailer(ticket, status)
    @greeting = "Hello Miss/Mr. #{last_name(ticket.fullname)}"
    @ticket = ticket
    @status = status
    mail(to: @ticket.email, subject: 'Update on the your flight booking')
  end

  def lastname(name)
    last_space_index = name.rindex(' ')
    name[last_space_index + 1..-1]
  end
end
