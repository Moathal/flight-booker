class FlightsController < ApplicationController

  def index
    @airports = Airport.all.map { |airport| ["#{airport.name}, #{airport.code}, #{airport.city}, #{airport.country}", airport.id]}
    @flights = Flight.where(search_params).limit(5)
  end

  private

  def search_params
    params.permit(:departure_airport_id, :arrival_airport_id, :start_time)
  end
end
