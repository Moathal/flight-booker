class TicketsController < ApplicationController
  def index
    @tickets = Ticket.where(booking_id: current_user.id).or(Ticket.where(passenger_id: current_user.id))
  end

  def new
    @flight = Flight.find(params[:flight_id])
    @num_passenger = params[:required_seats].to_i < 1 ? 1 : params[:required_seats].to_i
    @ticket = Ticket.new
  end

  def create
    passanger = Passanger.find_by(id: ticket_params[:passanger_email])
    if passanger.empty?
      @ticket = Ticket.new(ticket_params)
      @ticket.passanger = nil
    elsif passanger == current_user
      @ticket = Ticket.new(ticket_params)
      @ticket.passanger = current_user
    else
      @ticket = Ticket.new(ticket_params)
      @ticket.passanger = passanger
    end
    @ticket.booker = current_user
  end

  private

  def ticket_params
    params.require(:tickets).permit(:passenger_name, :passenger_email, :flight_id)
  end
end
