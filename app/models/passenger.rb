class Passenger < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :tickets, inverse_of: :passengers

  after_create :connect_passanger_to_ticket

  private

  def connect_passanger_to_ticket
    tickets = Ticket.where(passenger_email: self.email)
    if !tickets.empty?
      tickets.each do |ticket|
        ticket.update(passenger_id: self.id)
      end
    end
  end
end
