class Ticket < ApplicationRecord
  belongs_to :passenger, class_name: "Passenger", foreign_key: "passenger_id", optional: true
  belongs_to :booker, class_name: "Passenger", foreign_key: "booker_id"
  belongs_to :flight

  validate :unique_email_per_flight
  validate :physical_capability
  before_save {self.passenger_email = passenger_email.downcase.strip}

  private

  def unique_email_per_flight
    if Ticket.exists?(flight_id: flight_id, passenger_email: passenger_email)
      errors.add(:passenger_email, "This Passenger is already added to this flight")
    end
  end

# I know that I can do it using validate-overlap gem but it was felt good to solve it myself.

def physical_capability
  tickets = Ticket.where(passenger_email: self.passenger_email)

  this_flight_duration = Time.strptime(self.flight.duration, "%H:%M")
  this_flight_reserved_datetime = ((self.flight.start_time - 1.hour)..(self.flight.start_time + this_flight_duration + 1.hour))

  tickets.each do |ticket|
    other_flight_duration = ticket.flight.duration.in_time_zone
    other_flight_reserved_datetime = ((ticket.flight.start_time - 1.hour)..(ticket.flight.start_time + other_flight_duration + 1.hour))

    # Check for overlap
    if (other_flight_reserved_datetime).cover?(this_flight_reserved_datetime) ||
       (this_flight_reserved_datetime ).cover?(other_flight_reserved_datetime )
        errors.add(:flight_id, "time! It is already taken by the flight from #{ticket.flight.departure_airport.code} to #{ticket.flight.arrival_airport.code} at #{ticket.flight.start_time.strftime("%a, %H:%M, %d %b %Y")} that takes #{ticket.flight.duration} Hrs!!")
      break
    end
  end
end

end