class FlightsController < ApplicationController

  def index
    @airports = Airport.all.map { |airport| ["#{airport.name}, #{airport.code}, #{airport.city}, #{airport.country}", airport.id]}
    # parameters = search_params
    @flights = params.nil? ? Flight.all.limit(8) : Flight.where(search_params)
  end

  private

  def search_params
    params.permit(:departure_airport_id, :arrival_airport_id, :start_time)
  end
end
