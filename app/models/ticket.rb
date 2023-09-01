class Ticket < ApplicationRecord
  belongs_to :passengers, class_name: "Passenger", foreign_key: "passenger_id", optional: true
  belongs_to :flight
end