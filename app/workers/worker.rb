require 'sidekiq'

sidekiq.configure_client do |config|
  config.redis = { db: 1 }
end

sidekiq.configure_server do |config|
  config.redis = { db: 1 }
end

class TicketWorker
  include sidkiq::Worker

  def perform(status, ticket)
    TicketMailer.booker_mailer(ticket, status)
    case status
    when 'confirmed'
      sleep rand(0..5)
      TicketMailer.booking_confirmed(ticket)
    else
      sleep rand(0..5)
      TicketMailer.booking_rejected(ticket)
      delete_ticket(ticket)
      broadcast_cancel_message(ticket)
    end
  end

  def delete_ticket(ticket)
    broadcast_cancel_message(ticket)
    ticket.destroy
  end

  def broadcast_cancel_message(ticket)
    message = "We regret to tell you that the flight is already full therefore we cancelled your booking from #{ticket.flight.departure_airport.city} to #{ticket.flight.arrival_airport.city}."
    Turbo::StreamsChannel.broadcast_replace_to(
      "ticket_#{ticket.booker_id}",
      action: :replace, target: 'alert',
      partial: 'layouts/message',
      locals: { alert: message }
    )
  end
end