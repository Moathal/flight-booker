class Ticket < ApplicationRecord
  belongs_to :passenger, class_name: "Passenger", foreign_key: "passenger_id", optional: true
  belongs_to :booker, class_name: "Passenger", foreign_key: "booker_id"
  belongs_to :flight

  validate :unique_email_per_flight
  before_save {self.passenger_email = passenger_email.downcase.strip}

  private

  def unique_email_per_flight
    if Ticket.exists?(flight_id: flight_id, passenger_email: passenger_email)
      errors.add(:email, "This Passenger is alreadty added to this flight")
    end
  end
end