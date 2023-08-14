class FlightsController < ApplicationController

  def index
    @airports = Airport.all.map { |airport| ["#{airport.name}, #{airport.code}, #{airport.city}, #{airport.country}", airport.id]}
    # parameters = search_params
    @flights = search_params.nil? ? nil : Flight.where(search_params)
  end

  private

  def search_params
    params.require(:flight).permit(:departure_airport_id, :arrival_airport_id, :date)
  end
end
