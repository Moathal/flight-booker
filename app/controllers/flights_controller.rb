class FlightsController < ApplicationController

  def index
    @airports = Airport.all.map { |airport| ["#{airport.name}, #{airport.code}, #{airport.city}, #{airport.country}", airport.id]}
    search_params = params.permit(:departure_airport_id, :arrival_airport_id, :start_time)
    @flights = search_params.empty? ? Flight.where('seats > ?', 0).limit(5) : Flight.where(search_params).where('seats >= ?', params[:required_seats])
  end
end
