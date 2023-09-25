# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb

# Seed data for airports
# db/seeds.rb

# Seed data for airports
airports_data = [
  { name: "John F. Kennedy International Airport", country: "United States", city: "New York", code: "JFK" },
  { name: "Los Angeles International Airport", country: "United States", city: "Los Angeles", code: "LAX" },
  { name: "Heathrow Airport", country: "United Kingdom", city: "London", code: "LHR" },
  { name: "Charles de Gaulle Airport", country: "France", city: "Paris", code: "CDG" },
  { name: "Tokyo Haneda Airport", country: "Japan", city: "Tokyo", code: "HND" },
  { name: "Sydney Kingsford Smith Airport", country: "Australia", city: "Sydney", code: "SYD" },
  { name: "Dubai International Airport", country: "United Arab Emirates", city: "Dubai", code: "DXB" },
  { name: "Beijing Capital International Airport", country: "China", city: "Beijing", code: "PEK" }
]

airports_data.map { |data| Airport.create!(data) }

airports = Airport.all

airports.each {|airport| puts "<><><><><><><><><><><><><>><><><>#{airport.id}<><><><><><><><><><><><><><><><><><><><><><><><><><>"}

# Seed data for flights
airports.each do |departure|
  airports.each do |arrival|
    next if departure == arrival # Skip creating flights with same departure and arrival

    3.times do |i|
      Flight.create!(
        departure_airport_id: departure.id,
        arrival_airport_id: arrival.id,
        duration: "#{rand(1..4)}:#{rand(0..59).to_s.rjust(2, '0')}",
        start_time: (DateTime.now + i.days).change(hour: rand(0..23), min: rand(0..59)),
        seats: rand(0..255)
      )
    end
  end
end
