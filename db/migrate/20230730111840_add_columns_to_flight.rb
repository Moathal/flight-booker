class AddColumnsToFlight < ActiveRecord::Migration[7.0]
  def change
    add_column :flights, :departure_airport, :string
    add_column :flights, :arrival_airport, :string
    add_column :flights, :duration, :time
    add_column :flights, :start_time, :date
  end
end
