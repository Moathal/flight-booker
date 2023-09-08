class TicketsController < ApplicationController
  before_action :authenticate_passenger!

  def index
    puts "<><><><><><><><><><><><><><><>current_passenger_id: #{Ticket.where(booker_id: current_passenger.id).or(Ticket.where(passenger_id: current_passenger.id)).each do |single|
      single.passenger_name
    end
    }<><><><><><><><><><><>"
    @tickets = Ticket.where(booker_id: current_passenger.id).or(Ticket.where(passenger_id: current_passenger.id))
    @tickets.each {|ticket| "<><><><><><><><><><><><><><><><><><><><><> #{ticket.passenger_name} <><><><><><><><><><><><><><><><><><><>><><><><><><><><"}
  end

  def new
    @flight = Flight.find(params[:flight_id])
    @num_passenger = params[:required_seats].to_i < 1 ? 1 : params[:required_seats].to_i
    @ticket = Ticket.new
  end

  def create
    @ticket = ticket
    if @ticket.save!
      render :index
    else
      render :new
    end
  end

  def ticket
    passanger = Passenger.find_by(email: ticket_params[:passenger_email])
    if passanger.nil?
    @ticket = Ticket.new(ticket_params)
    @ticket.passenger = nil
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
    params.require(:ticket).permit(:passenger_name, :passenger_email, :flight_id)
  end
end
