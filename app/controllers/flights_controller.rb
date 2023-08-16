class FlightsController < ApplicationController

  def index
    @airports = Airport.all.map { |airport| ["#{airport.name}, #{airport.code}, #{airport.city}, #{airport.country}", airport.id]}
    # parameters = search_params
      @flights = !params.nil? ? Flight.all.limit(8) : Flight.where(params[:departure_airport_id, :arrival_airport_id, :date])
  end

  private

  # def search_params
  #  params.nil? ? nil :  
  # end
end
