class FlightsController < ApplicationController

  def index
    @airports = Airport.all.map { |airport| ["#{airport.name}, #{airport.code}, #{airport.city}, #{airport.country}", airport.id]}
    # @flights = queried_flights(search_params)
  end

  def search
    @airport = Airport.find(search_params)
  end

  private

  def search_params
    params.require(:flight).permit(:departure_airport_id, :arrival_airport_id, :date)
  end
end
