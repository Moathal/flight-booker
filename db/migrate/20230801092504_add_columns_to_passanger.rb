class AddColumnsToPassanger < ActiveRecord::Migration[7.0]
  def change
    add_column :passangers, :fullname, :string
    add_column :passangers, :birthday, :string
  end
end
