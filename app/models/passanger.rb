class Passanger < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :flights, through: :tickets, source: :tickets_table_foreign_key_to_flights_table
  has_many :tickets
end
