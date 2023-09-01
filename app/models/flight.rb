class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport', foreign_key: 'departure_airport_id'
  belongs_to :arrival_airport, class_name: 'Airport', foreign_key: 'arrival_airport_id'
  has_many :passengers, through: :tickets, source: :passenger
  has_many :tickets

  after_create :add_flight_code

  def seats_calculator(reserved_seats)
    self.seats = seats - reserved_seats
    self.save
  end

  def add_flight_code
    self.code = "#{departure_airport.id}#{arrival_airport.id}-#{departure_airport.code}-#{arrival_airport.code}-#{id}"
    self.save
  end
end
