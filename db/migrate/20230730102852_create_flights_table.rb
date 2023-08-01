class CreateFlightsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.string :departure_airport
      t.string :arrival_airport
      t.time :duration
      t.date :start_time

      t.timestamps
    end
    
  end
end
