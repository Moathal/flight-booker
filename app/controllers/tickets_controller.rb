class TicketsController < ApplicationController
  before_action :authenticate_passenger!

  def index
    @tickets = Ticket.where(booking_id: current_passenger.id).or(Ticket.where(passenger_id: current_passenger.id))
  end

  def new
    @flight = Flight.find(params[:flight_id])
    @num_passenger = params[:required_seats].to_i < 1 ? 1 : params[:required_seats].to_i
    @ticket = Ticket.new
  end

  def create
    @ticket = ticket
    if @ticket.save?
      render @ticket
    else
      render @ticket.new
    end
  end

  def ticket
    passanger = Passenger.find_by(email: ticket_params[:passenger_email])
    if passanger.nil?
    @ticket = Ticket.new(ticket_params)
    @ticket.passanger = nil
    elsif passenger == current_passenger
      @ticket = Ticket.new(ticket_params)
      @ticket.passanger = current_passenger
    else
      @ticket = Ticket.new(ticket_params)
      @ticket.passanger = passenger
    end
    @ticket.booker = current_passenger
  end

  private

  def ticket_params
    puts "<><><><><><><><><><><><><><><><><><><>#{params[:flight_id]}<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>"
    params.require(:ticket).permit(:passenger_name, :passenger_email, :flight_id)
  end
end
