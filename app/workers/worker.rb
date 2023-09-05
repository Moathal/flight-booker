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
    case status
    when 'confirmed'
      sleep rand(0..20)
      TicketMailer.booking_confirmed(ticket)
    else
      sleep rand(0..20)
      TicketMailer.booking_confirmed(ticket)
    end
  end
end