class TicketsController < ApplicationController
  before_action :authenticate_passenger!

  def index
    @tickets = Ticket.where(booker_id: current_passenger.id).or(Ticket.where(passenger_id: current_passenger.id))
  end

  def new
    @flight = Flight.find(params[:flight_id])
    @num_passenger = params[:required_seats].to_i < 1 ? 1 : params[:required_seats].to_i
    @ticket = Ticket.new
  end

  def create
    @ticket = ticket
    if @ticket.save!
      redirect_to :tickets
    else
      render :new
    end
  end

  def ticket
    passenger = Passenger.find_by(email: ticket_params[:passenger_email].downcase.strip)
    @ticket = Ticket.new(ticket_params)
    if passenger.nil?
    @ticket.passenger = nil
    elsif passenger == current_passenger
      @ticket.passenger = current_passenger
    else
      @ticket.passenger = passenger
    end
    @ticket.booker = current_passenger
    @ticket
  end

  private

  def ticket_params
    params.require(:ticket).permit(:passenger_name, :passenger_email, :flight_id)
  end
end
