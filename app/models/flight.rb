class Flight < ApplicationRecord
  belongs_to :airport
  has_many :passangers, through: :tickets, source: :passanger
end