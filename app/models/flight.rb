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
    depart_airport_id = format_integer_with_fixed_digits(departure_airport.id, 4) 
    arrive_airport_id = format_integer_with_fixed_digits(arrival_airport.id, 4) 
    flight_id = format_integer_with_fixed_digits(id, 4) 
    self.code = "#{depart_airport_id}#{departure_airport.code}-#{flight_id}#{arrive_airport_id}-#{arrival_airport.code}"
    self.save
  end

  def format_integer_with_fixed_digits(number, digits)
    formatted_number = number.to_s.rjust(digits, '0')
  end
end
