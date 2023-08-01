class CreateTicketsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.references :passenger, null: false, foreign_key: true
      t.references :flight, null: false, foreign_key: true
      t.string :seat

      t.timestamps
    end
  end
end
