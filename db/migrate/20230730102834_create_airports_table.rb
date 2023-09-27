class CreateAirportsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :airports do |t|
    t.string :name
    t.string :country
    t.string :city
    t.string :code

    t.timestamps
    end
  end
end
