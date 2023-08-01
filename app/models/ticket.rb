class Ticket < ApplicationRecord
  belongs_to :passangers, class_name: "passanger", foreign_key: "passanger_id"
  belongs_to :airports, class_name: "airport", foreign_key: "airport_id"
end