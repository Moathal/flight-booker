# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb

# Seed data for airports
Airport.create(name: "John F. Kennedy International Airport", country: "United States", city: "New York", code: "JFK")
Airport.create(name: "Los Angeles International Airport", country: "United States", city: "Los Angeles", code: "LAX")
Airport.create(name: "Heathrow Airport", country: "United Kingdom", city: "London", code: "LHR")
Airport.create(name: "Charles de Gaulle Airport", country: "France", city: "Paris", code: "CDG")
Airport.create(name: "Tokyo Haneda Airport", country: "Japan", city: "Tokyo", code: "HND")
Airport.create(name: "Sydney Kingsford Smith Airport", country: "Australia", city: "Sydney", code: "SYD")
Airport.create(name: "Dubai International Airport", country: "United Arab Emirates", city: "Dubai", code: "DXB")
Airport.create(name: "Beijing Capital International Airport", country: "China", city: "Beijing", code: "PEK")

# Seed data for flights
flight_data = [
  { departure_code: "JFK", arrival_code: "LAX", duration: "08:00", days_offset: 1 },
  { departure_code: "LHR", arrival_code: "CDG", duration: "01:30", days_offset: 2 },
  # Add more flight data here
]

flight_data.each do |data|
  departure_airport = Airport.find_by(code: data[:departure_code])
  arrival_airport = Airport.find_by(code: data[:arrival_code])

  3.times do |i|
    Flight.create(
      departure_airport_id: departure_airport.id,
      arrival_airport_id: arrival_airport.id,
      duration: data[:duration],
      start_time: Date.today + data[:days_offset].days + i.days
    )
  end
end
# db/seeds.rb

# Seed data for airports
Airport.create(name: "John F. Kennedy International Airport", country: "United States", city: "New York", code: "JFK")
Airport.create(name: "Los Angeles International Airport", country: "United States", city: "Los Angeles", code: "LAX")
Airport.create(name: "Heathrow Airport", country: "United Kingdom", city: "London", code: "LHR")
Airport.create(name: "Charles de Gaulle Airport", country: "France", city: "Paris", code: "CDG")
Airport.create(name: "Tokyo Haneda Airport", country: "Japan", city: "Tokyo", code: "HND")
Airport.create(name: "Sydney Kingsford Smith Airport", country: "Australia", city: "Sydney", code: "SYD")
Airport.create(name: "Dubai International Airport", country: "United Arab Emirates", city: "Dubai", code: "DXB")
Airport.create(name: "Beijing Capital International Airport", country: "China", city: "Beijing", code: "PEK")

# Seed data for flights
flight_data = [
  { departure_code: "JFK", arrival_code: "LAX", duration: "08:00", days_offset: 1 },
  { departure_code: "LHR", arrival_code: "CDG", duration: "01:30", days_offset: 2 },
  # Add more flight data here
]

flight_data.each do |data|
  departure_airport = Airport.find_by(code: data[:departure_code])
  arrival_airport = Airport.find_by(code: data[:arrival_code])

  3.times do |i|
    Flight.create!(
      departure_airport_id: departure_airport.id,
      arrival_airport_id: arrival_airport.id,
      duration: data[:duration],
      start_time: Date.today + data[:days_offset].days + i.days
    )
  end
end
