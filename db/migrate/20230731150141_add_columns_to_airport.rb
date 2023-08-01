class AddColumnsToAirport < ActiveRecord::Migration[7.0]
  def change
    add_column :airports, :country, :string
    add_column :airports, :city, :string
    add_column :airports, :code, :text
  end
end
