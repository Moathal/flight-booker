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
  # I know that I can do it using validate-overlap gem but it was cool to solve it myself.
  def physical_capability
    tickets = Ticket.where(passenger_email: self.passenger_email)
    this_flight_duration = Time.strptime(self.duration, "%H:%M") + 2.hours
    this_flight_reserved_datetime = self.start_time.to_time - 1.hours + this_flight_duration.seconds_since_midnight
    
    tickets.each do |ticket|
      other_flight_duration = Time.strptime(ticket.duration, "%H:%M") + 2.hours
      other_flight_reserved_datetime = ticket.start_time.to_time - 1.hours + other_flight_duration.seconds_since_midnight

      if self.start_time.to_time <= other_flight_reserved_datetime && self.start_time.to_time >= ticket.start_time.to_time - 1.hours ||
        ticket.start_time.to_time <= this_flight_reserved_datetime && ticket.start_time.to_time >= self.start_time.to_time - 1.hours 
        errors.add(:start_time, "You already have a flight in the specified time!!")
      end
    end
  end
end