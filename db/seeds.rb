# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Airport.find_or_create_by(name: "SFO", code: "SFO", country: "San Francisco, US", city: 'San Francisco, US')
Airport.find_or_create_by(name: "NYC", code: "NYC", country: "New York City, US", city: "New York City, US ")
Airport.find_or_create_by(name: "ATL", code: "ATL", country: "Atlanta, US", city: "Atlanta, US")
Airport.find_or_create_by(name: "ORD", code: "ORD", country: "Chicago, US", city: "Chicago, US")
Airport.find_or_create_by(name: "LAX", code: "LAX", country: "Los Angeles, US", city: "Los Angeles, US")
Airport.find_or_create_by(name: "DFW", code: "DFW", country: "Dallas, US", city: "Dallas, US")
Airport.find_or_create_by(name: "MCO", code: "MCO", country: "Orlando, US", city: "Orlando, US")
Airport.find_or_create_by(name: "DEN", code: "DEN", country: "Denver, US", city: "Denver, US")