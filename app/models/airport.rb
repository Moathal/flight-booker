class Airport < ApplicationRecord
  has_many :passengers, through: :flights, source: :passenger
  has_many :tickets, through: :flights, source: :ticket
  has_many :departing_flights, class_name: :Flight, foreign_key: 'departure_airport_id'
  has_many :arriving_flights, class_name: :Flight, foreign_key: 'arrival_airport_id'
end