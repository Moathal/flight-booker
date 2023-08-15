class CreateFlightsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.references :departure_airport, null: false, foreign_key: { to_table: :airports }
      t.references :arrival_airport, null: false, foreign_key: { to_table: :airports }
      t.string :duration
      t.date :start_time

      t.timestamps
    end
    
  end
end
