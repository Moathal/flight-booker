module PostsConcern
  extend ActiveSupport::Concern

  # def find_flights_value_when_depart_equal_arrive(start_time, required_seats)
  #   if start_time.empty? && !required_seats.empty?
  #     Flight.where('seats >= ?', required_seats.to_i)
  #   elsif !required_seats.empty? && !start_time.empty?
  #     date = start_time.to_date
  #     Flight.where(start_time: date.beginning_of_day..date.end_of_day).where('seats >= ?', required_seats.to_i)
  #   else
  #     Flight.where(start_time: date.beginning_of_day..date.end_of_day)
  #   end
  # end

  # def find_flights_value_when_depart_not_equal_arrive(parameters, start_time, required_seats)
  #   if start_time.empty? && !required_seats.empty?
  #     Flight.where(parameters).where('seats >= ?', required_seats.to_i)
  #   elsif !required_seats.empty? && !start_time.empty?
  #     date = start_time.to_date
  #     Flight.where(parameters).where(start_time: date.beginning_of_day..date.end_of_day).where('seats >= ?', required_seats.to_i)
  #   else
  #     Flight.where(parameters).where(start_time: date.beginning_of_day..date.end_of_day)
  #   end
  # end

  def find_flights_value_when_depart_equal_arrive(start_time, required_seats)
    if start_time.empty?
      find_flights_with_empty_start_time(required_seats)
    else
      find_flights_with_non_empty_start_time(start_time, required_seats)
    end
  end

  def find_flights_with_empty_start_time(required_seats)
    return if required_seats.empty?

    Flight.where('seats >= ?', required_seats.to_i)
  end

  def find_flights_with_non_empty_start_time(start_time, required_seats)
    date = start_time.to_date
    flights = Flight.where(start_time: date.beginning_of_day..date.end_of_day)
    flights = flights.where('seats >= ?', required_seats.to_i) unless required_seats.empty?
    flights
  end

  def find_flights_value_when_depart_not_equal_arrive(parameters, start_time, required_seats)
    if start_time.empty?
      find_flights_with_empty_start_time_and_depart_not_equal_arrive(parameters, required_seats)
    else
      find_flights_with_non_empty_start_time_and_depart_not_equal_arrive(parameters, start_time, required_seats)
    end
  end

  def find_flights_with_empty_start_time_and_depart_not_equal_arrive(parameters, required_seats)
    if !required_seats.empty?
      Flight.where(parameters).where('seats >= ?', required_seats.to_i)
    else
      Flight.where(parameters)
    end
  end

  def find_flights_with_non_empty_start_time_and_depart_not_equal_arrive(parameters, start_time, required_seats)
    date = start_time.to_date
    flights = Flight.where(parameters).where(start_time: date.beginning_of_day..date.end_of_day)
    flights = flights.where('seats >= ?', required_seats.to_i) unless required_seats.empty?
    flights
  end
end
