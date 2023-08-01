class CreatePassangersTable < ActiveRecord::Migration[7.0]
  def change
    create_table :passengers do |t|
      t.string :fullname
      t.date :birthday
  
      t.timestamps
    end
    
  end
end
