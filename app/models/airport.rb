class Airport < ApplicationRecord
  has_many :flights through :tickets, source: :tickets_table_foreign_key_to_flights_table
  has_many :tickets
end