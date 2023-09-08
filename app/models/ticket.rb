class Ticket < ApplicationRecord
  belongs_to :passenger, class_name: "Passenger", foreign_key: "passenger_id", optional: true
  belongs_to :booker, class_name: "Passenger", foreign_key: "booker_id"
  belongs_to :flight
end