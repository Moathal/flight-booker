# Preview all emails at http://localhost:3000/rails/mailers/ticket_mailer
class TicketMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/ticket_mailer/booking_confirmed
  def booking_confirmed
    TicketMailer.booking_confirmed
  end

  # Preview this email at http://localhost:3000/rails/mailers/ticket_mailer/booking_rejected
  def booking_rejected
    TicketMailer.booking_rejected
  end

end
