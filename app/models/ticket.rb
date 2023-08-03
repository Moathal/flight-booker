class Ticket < ApplicationRecord
  belongs_to :passengers, class_name: "Passenger", foreign_key: "passenger_id"
  belongs_to :airports, class_name: "airport", foreign_key: "airport_id"
  belongs_to :flight
end