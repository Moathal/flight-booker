class Airport < ApplicationRecord
  has_many :passangers through :flights, source: :passanger
  has_many :tickets through :flights, source: :ticket
  has_many :flights
end