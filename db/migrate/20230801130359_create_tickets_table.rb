class CreateTicketsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.text :passenger_name, null: false
      t.text :passenger_email, null: false
      t.references :passenger, null: true, foreign_key: true
      t.references :flight, null: false, foreign_key: true
      t.references :booker, null: false, foreign_key: { to_table: :passengers }

      t.timestamps
    end
  end
end
