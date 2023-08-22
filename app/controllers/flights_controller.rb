class FlightsController < ApplicationController

  def index
    @airports = Airport.all.map { |airport| ["#{airport.name}, #{airport.code}, #{airport.city}, #{airport.country}", airport.id]}
    search_params = params.permit(:departure_airport_id, :arrival_airport_id)
    puts "<><><><><><><><><><><><><><><><><><><><><>REQUIRED SEATS: #{params[:required_seats].empty?}<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>"
    puts "<><><><><><><><><><><><><><><><><><><><><><>START DATE: #{params[:start_time].empty?}<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>"
    @flights = search_result(search_params, params[:start_time], params[:required_seats])
  end

  def search_result(params, start_time, required_seats)
    
    if params.empty?
      Flight.where('seats > ?', 0).limit(5) 
    else
      required_seats = required_seats.to_i
      date = start_time.to_date
      search_params = params.merge(start_time: date.beginning_of_day..date.end_of_day)
      Flight.where(search_params).where('seats >= ?', required_seats)
    end
  end

  def valid_flights_value(parameters, start_time, required_seats)
    date_seats = [start_time, required_seats]
    case date_seats
    when date_seats[0].empty? && date_seats[1].empty? && parameters.departure_airport_id != parameters.arrival_airport_id
      Flight.where(parameters)
    when date_seats[0].empty? && !date_seats[1].empty? && parameters.departure_airport_id != parameters.arrival_airport_id
      Flight.where(parameters).where('seats >= ?', required_seats)
    when !date_seats[0].empty? && !date_seats[1].empty? && parameters.departure_airport_id != parameters.arrival_airport_id
      search_params = params.merge(start_time: date.beginning_of_day..date.end_of_day)
      Flight.where(search_params).where('seats >= ?', required_seats)
    when !date_seats[0].empty? && !date_seats[1].empty? && parameters.departure_airport_id = parameters.arrival_airport_id
      date = start_time.to_date
      Flight.where(start_time: date.beginning_of_day..date.end_of_day).where('seats >= ?', required_seats)
    else
      Flight.where('seats > ?', 0).limit(5)
    end
  end
end
