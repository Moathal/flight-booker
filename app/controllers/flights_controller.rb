class FlightsController < ApplicationController
  include FlightsConcern

  def index
    @airports = Airport.pluck(:name, :code, :city, :country, :id).map do |name, code, city, country, id|
      ["#{name}, #{code}, #{city}, #{country}", id]
    end
    search_params = params.permit(:departure_airport_id, :arrival_airport_id)
    @flights = search_result(search_params, params[:start_time], params[:required_seats])
    @flights.each { |flight| puts "<>{}<>{}<>{}<>{}<>{}<>{} #{flight.id} <>{}<>{}<>{}<>{}<>{}<>{}<>{}<>{}<>{}<>{}" }
  end

  def search_result(parameters, start_time, required_seats)
    if parameters.empty?
      Flight.where('seats > ?', 0).limit(5)
    elsif parameters['departure_airport_id'] == parameters['arrival_airport_id']
      find_flights_value_when_depart_equal_arrive(start_time, required_seats)
    else
      find_flights_value_when_depart_not_equal_arrive(parameters, start_time, required_seats)
    end
  end
end
